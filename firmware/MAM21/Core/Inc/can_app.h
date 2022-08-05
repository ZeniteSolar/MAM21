#ifndef CAN_APP_H
#define CAN_APP_H

#include "can_ids.h"
#include "machine.h"
#include "stm32g4xx_hal.h"
#include "bit_utils.h"
#include "utils.h"

typedef struct
{
    FDCAN_HandleTypeDef *hfdcan;
} can_hardware_t;

typedef struct
{
    FDCAN_RxHeaderTypeDef RxHeader;
    union
    {
        uint8_t raw[8];
        struct
        {
            uint8_t signature;
            uint8_t payload[7];
        };
    } data;
} can_msg_t;

void can_init(FDCAN_HandleTypeDef *hfdcan);
void can_config(FDCAN_HandleTypeDef *hfdcan1);
void can_task_run(void);
void can_parse(can_msg_t *msg);

#endif