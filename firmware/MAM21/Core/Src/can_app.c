#include "can_app.h"
#include "can_parser.h"

static can_hardware_t can_hardware;
static struct modules_t
{
    struct
    {
        uint32_t mic : 1;
        uint32_t mswi : 1;
    } connected;
    struct
    {
        uint32_t mic : 1;
        uint32_t mswi : 1;
    } error;
} modules;

void can_config(FDCAN_HandleTypeDef *hfdcan1)
{
    FDCAN_FilterTypeDef sFilterConfig;

    /* Configure Rx filter */
    sFilterConfig.IdType = FDCAN_STANDARD_ID;
    sFilterConfig.FilterIndex = 0;
    sFilterConfig.FilterType = FDCAN_FILTER_MASK;
    sFilterConfig.FilterConfig = FDCAN_FILTER_TO_RXFIFO0;
    sFilterConfig.FilterID1 = 0x00;
    sFilterConfig.FilterID2 = 0x00;

    can_hardware.fifo = FDCAN_RX_FIFO0;

    if (HAL_FDCAN_ConfigFilter(hfdcan1, &sFilterConfig) != HAL_OK)
    {
        LOG_ERROR("Failed to configure CAN");
    }

    /* Configure global filter:
      Filter all remote frames with STD and EXT ID
      Reject non matching frames with STD ID and EXT ID */
    if (HAL_FDCAN_ConfigGlobalFilter(hfdcan1, FDCAN_REJECT, FDCAN_REJECT, FDCAN_FILTER_REMOTE, FDCAN_FILTER_REMOTE) != HAL_OK)
    {
        LOG_ERROR("Failed to configure CAN");
    }

    /* Start the FDCAN module */
    if (HAL_FDCAN_Start(hfdcan1) != HAL_OK)
    {
        LOG_ERROR("Failed to configure CAN");
    }

    // if (HAL_FDCAN_ActivateNotification(hfdcan1, FDCAN_IT_RX_FIFO0_NEW_MESSAGE, 0) != HAL_OK)
    // {
    //     LOG_ERROR("Failed to configure CAN");
    // }
}
void can_init(FDCAN_HandleTypeDef *hfdcan)
{
    can_hardware.hfdcan = hfdcan;
    can_config(hfdcan);
}

void can_parse_mic_motor(can_msg_t *msg)
{
    CAN_DECLARE_MSG_OF_TYPE(can_mic19_motor_msg_t, mic_motor, msg);
    modules.connected.mic = 1;
    if (!modules.connected.mswi)
    {
        machine_set_motor_duty((float)mic_motor->d / 255.0f);
    }
    machine_set_motor_on(mic_motor->motor.motor_on);
    machine_set_motor_dms(mic_motor->motor.dms_on);
    machine_set_motor_reverse(mic_motor->motor.reverse);
}

void can_parse_mswi_motor(can_msg_t *msg)
{
    CAN_DECLARE_MSG_OF_TYPE(can_mswi19_motor_msg_t, mswi_motor, msg);
    modules.connected.mswi = 1;

    machine_set_motor_duty((float)mswi_motor->d / 255.0f);
}

CAN_REGISTER_PARSER(122);

void can_handle_timeout(uint8_t signature)
{
    switch (signature)
    {
    case CAN_SIGNATURE_MIC19:
        modules.connected.mic = 0;
        machine_set_motor_on(DISABLE);
        break;
    case CAN_SIGNATURE_MSWI19:
        modules.connected.mswi = 0;
    default:
        break;
    }
}

void can_task_run(void)
{
    CAN_REGISTER_TOPICS(mic,
                        {CAN_MSG_MIC19_MOTOR_ID, &can_parse_mic_motor});

    CAN_REGISTER_TOPICS(mswi,
                        {CAN_MSG_MSWI19_MOTOR_ID, &can_parse_mswi_motor});

    CAN_REGISTER_MODULES(mam_rx,
                         {CAN_SIGNATURE_MIC19, &CAN_TOPICS_NAME(mic), 10},
                         {CAN_SIGNATURE_MSWI19, &CAN_TOPICS_NAME(mswi), 0});

    FDCAN_RxHeaderTypeDef RxHeader;
    can_msg_t msg;
    if (HAL_FDCAN_GetRxFifoFillLevel(can_hardware.hfdcan, can_hardware.fifo))
    {
        if (HAL_FDCAN_GetRxMessage(can_hardware.hfdcan, can_hardware.fifo, &RxHeader, msg.raw) != HAL_OK)
        {
            LOG_ERROR("Failed to receive can message");
        }
        msg.id = RxHeader.Identifier;
        can_parser(&CAN_MODULES_NAME(mam_rx), &msg);
    }
    can_update_timeout(&CAN_MODULES_NAME(mam_rx));
}