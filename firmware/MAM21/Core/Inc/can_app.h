#ifndef CAN_APP_H
#define CAN_APP_H 



void can_init(void);
void can_config(void);
void can_task_run(void);

typedef struct {
    FDCAN_RxHeaderTypeDef RxHeader;
    union{
        uint8_t signature;
        uint8_t data[8];
    };
} can_rx_msg_t;

#endif