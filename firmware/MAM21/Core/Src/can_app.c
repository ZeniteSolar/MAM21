#include "can_app.h"

can_hardware_t can_hardware;

void can_init(FDCAN_HandleTypeDef *hfdcan)
{
    can_hardware.hfdcan = hfdcan;
    can_config(hfdcan);
}
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

    if (HAL_FDCAN_ActivateNotification(hfdcan1, FDCAN_IT_RX_FIFO0_NEW_MESSAGE, 0) != HAL_OK)
    {
        LOG_ERROR("Failed to configure CAN");
    }
}

void can_task_run(void)
{
}

void can_app_extractor_mic19_motor(can_msg_t *msg)
{
    if (msg->data.signature == CAN_SIGNATURE_MIC19)
    {

        system_flags.motor_on = bit_is_set(msg->data.raw[CAN_MSG_MIC19_MOTOR_MOTOR_BYTE],
                                           CAN_MSG_MIC19_MOTOR_MOTOR_MOTOR_ON_BIT);

        system_flags.dms = bit_is_set(msg->data.raw[CAN_MSG_MIC19_MOTOR_MOTOR_BYTE],
                                      CAN_MSG_MIC19_MOTOR_MOTOR_DMS_ON_BIT);

        system_flags.reverse = bit_is_set(msg->data.raw[CAN_MSG_MIC19_MOTOR_MOTOR_BYTE],
                                          CAN_MSG_MIC19_MOTOR_MOTOR_REVERSE_BIT);

        system_infos.dt = msg->data.raw[CAN_MSG_MIC19_MOTOR_D_BYTE] / 255.0f;

        machine_set_motor_duty(system_infos.dt);
        machine_set_motor_on(system_flags.motor_on);
        machine_set_motor_dms(system_flags.dms);
        machine_set_motor_reverse(system_flags.reverse);
    }
}

void can_parse_mic19_msg(can_msg_t *msg)
{
    switch (msg->RxHeader.Identifier)
    {
    case CAN_MSG_MIC19_MOTOR_ID:
        can_app_extractor_mic19_motor(msg);
        break;
    case CAN_MSG_MIC19_STATE_ID:

        break;
    default:

        break;
    }
}

void can_parse(can_msg_t *msg)
{
    switch (msg->data.signature)
    {
    case CAN_SIGNATURE_MIC19:
        can_parse_mic19_msg(msg);
        break;
    default:
        break;
    }
}