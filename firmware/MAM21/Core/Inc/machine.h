#ifndef MACHINE_H
#define MACHINE_H 

#include "stm32g4xx_hal.h"


typedef enum {
    STATE_INITIALIZING,
    STATE_CONTACTOR,
    STATE_IDLE,
    STATE_RUNNING,
    STATE_ERROR,
} state_machine_t;

typedef union {
    struct{
        uint32_t     motor_on        :1;
        uint32_t     dms             :1;
        uint32_t     pot_zero_width  :1;
        uint32_t     reverse         :1;
    };
    uint32_t   all__;
} system_flags_t;

typedef union {
    struct{
        uint32_t     overcurrent     :1;
        uint32_t     overvoltage     :1;
        uint32_t     overheat        :1;
        uint32_t     fault           :1;
        uint32_t     no_canbus       :1;
    };
        uint32_t   all;
} error_flags_t;

typedef struct {
    float       dt;            //duty cycle
    float       io;            //output current (A)
    float       vo;            //output voltage (V)
    float       vi;            //input voltage (V)
    float       temp;          //temperature (ºC)
} system_infos_t;

void machine_init(void);
void machine_run(void);

void set_state_initializing(void);
void set_state_idle(void);
void set_state_running(void);
void set_state_error(void);

void task_initializing(void);
void task_idle(void);
void task_running(void);
void task_error(void);

void machine_set_run(void);
void machine_set_motor_duty(float D);
void machine_set_motor_on(FunctionalState motor_on);
void machine_set_motor_dms(FunctionalState dms);
void machine_set_motor_reverse(FunctionalState reverse);

typedef struct {
    uint32_t run;
    state_machine_t state;
    struct {
        float duty;
        FunctionalState dms;
        FunctionalState motor_on;
        FunctionalState reverse;
        uint32_t pot_zero_with;
    }motor;
}machine_t;



extern system_infos_t system_infos;
extern system_flags_t system_flags;
extern error_flags_t error_flags;

#endif //MACHINE_H