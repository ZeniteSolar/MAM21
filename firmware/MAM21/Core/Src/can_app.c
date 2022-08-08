#include "can_app.h"

static can_hardware_t can_hardware;
static module_t mic;

void can_init(FDCAN_HandleTypeDef *hfdcan)
{
    can_hardware.hfdcan = hfdcan;
    can_config(hfdcan);
}

void can_task_run(void)
{
    can_msg_t Rx_msg;
    if (HAL_FDCAN_GetRxFifoFillLevel(can_hardware.hfdcan, can_hardware.fifo))
    {
        if (HAL_FDCAN_GetRxMessage(can_hardware.hfdcan, can_hardware.fifo, &Rx_msg.RxHeader, Rx_msg.data.raw) != HAL_OK)
        {
            LOG_ERROR("Failed to receive can message");
        }
        can_parse(&Rx_msg);
    }
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