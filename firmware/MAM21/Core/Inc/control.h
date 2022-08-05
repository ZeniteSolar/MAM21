/**
 ******************************************************************************
 * @file    machine.h
 * @brief   This file contains the control state machine, does the control action
 *  and forbids abrupt variations in the motor. Is in the midle level being
 * betwen the main state machine and the hardware,
 ******************************************************************************
 */

#ifndef CONTROL_H
#define CONTROL_H

#include <math.h>
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

/*
 *  Initialize control state machine
 * \param pwm_htim Pwm Time Base Handle
 */
void control_init(TIM_HandleTypeDef *pwm_htim);

/*
 * Run the state machine
 */
void control_run(void);

/*
 * Clear all internal states
 */
void control_clear(void);

/*
 * Set target setpoint of the duty cycle
 * \param D duty cycle target setpoint
 */
void control_set_duty_target(float D);

/*
 *   Enable motor
 * \param enable enable motor
 */
void control_set_enable_motor(FunctionalState enable);

/*
 *  Reverse motor
 * \param reverse reverse motor
 */
void control_set_reverse_motor(FunctionalState reverse);

#endif