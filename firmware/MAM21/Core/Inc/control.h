#ifndef CONTROL_H
#define CONTROL_H 

#include "stm32g4xx_hal.h"
#include "utils.h"
#include "h_bridge.h"

typedef enum
{
    CONTROL_STOPPED,
    CONTROL_STOPPING,
    CONTROL_FORWARD,
    CONTROL_REVERSE
} state_control_t;

typedef struct
{
    
    struct
    {
        FunctionalState enable : 1;  // enable motor
        FunctionalState reverse : 1; // reverse motor
    } flags;
    state_control_t state; // control machine state
    float duty_target;     // input of duty cycle
    float duty_setpoint;   // duty cycle setpoint
    float duty;            // real duty cycle
    float io;              // output current (A)
    float vo;              // output voltage (V)
    float vi;              // input voltage (V)
    float temp;            // temperature (ºC)
    float rpm;             // motor angular velocity (rpm)
} control_t;

void control_init(TIM_HandleTypeDef *pwm_htim);
void control_run(void);
void control_clear(void);

void control_set_state_stopped(void);
void control_set_state_stopping(void);
void control_set_state_forward(void);
void control_set_state_reverse(void);

void control_task_stopped(void);
void control_task_stopping(void);
void control_task_forward(void);
void control_task_reverse(void);

void control_compute_duty(void);

void control_set_duty_target(float D);
void control_set_enable_motor(FunctionalState enable);
void control_set_reverse_motor(FunctionalState reverse);



#endif