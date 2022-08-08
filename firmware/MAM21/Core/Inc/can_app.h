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
    uint32_t fifo;
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

typedef struct
{
    const uint8_t signature;   // Module signature
    const uint32_t timeout;    // Time elapsed without messages to consider lost conection
    uint32_t time_without_msg; // Time elapsed without messages
    uint32_t connected;        // Module conected
} module_t;

void can_init(FDCAN_HandleTypeDef *hfdcan);

void can_task_run(void);
void can_parse(can_msg_t *msg);

#endif