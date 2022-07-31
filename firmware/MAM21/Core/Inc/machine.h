#ifndef MACHINE_H
#define MACHINE_H 

#include "control.h"
#include "can_app.h"

typedef enum state_machine{
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

struct {
    float       dt;            //duty cycle
    float       io;            //output current (A)
    float       vo;            //output voltage (V)
    float       vi;            //input voltage (V)
    float       temp;          //temperature (ºC)
} system_infos_t;


void machine_run(void);

void set_state_initializing(void);
void set_state_idle(void);
void set_state_running(void);
void set_state_error(void);

void task_initializing(void);
void task_idle(void);
void task_running(void);
void task_error(void);


struct machine_t{
    uint32_t run;
    state_machine_t state;
};

extern system_flags_t system_flags;
extern error_flags_t error_flags;

#endif //MACHINE_H