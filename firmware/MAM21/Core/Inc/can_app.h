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
} can_rx_msg_t;

/*
 *   Initialize can module
 *   \param hfdcan can handle
 */
void can_init(FDCAN_HandleTypeDef *hfdcan);

/*
 *   Run can module, it sends and recive can messages
 */
void can_task_run(void);

/*
 *   Parse an can message
 */
void can_parse(can_rx_msg_t *msg);

#endif