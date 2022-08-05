/**
 ******************************************************************************
 * @file    machine.h
 * @brief   This file contains the main state machine, is the most high
 *  level inteface between the can bus messages and hardware.
 ******************************************************************************
 */

#ifndef MACHINE_H
#define MACHINE_H 

#include "stm32g4xx_hal.h"

typedef enum
{
    STATE_INITIALIZING,
    STATE_CONTACTOR,
    STATE_IDLE,
    STATE_RUNNING,
    STATE_ERROR,
} state_machine_t;

/*
 *  System flags
 */
typedef union
{
    struct
    {
        uint32_t motor_on : 1;
        uint32_t dms : 1;
        uint32_t pot_zero_width : 1;
        uint32_t reverse : 1;
    };
    uint32_t all__;
} system_flags_t;

/*
 *  Error flags
 */
typedef union
{
    struct
    {
        uint32_t overcurrent : 1;
        uint32_t overvoltage : 1;
        uint32_t overheat : 1;
        uint32_t fault : 1;
        uint32_t no_canbus : 1;
    };
    uint32_t all;
} error_flags_t;

// Share phisical informations abaout the system
typedef struct
{
    float dt;   // duty cycle
    float io;   // output current (A)
    float vo;   // output voltage (V)
    float vi;   // input voltage (V)
    float temp; // temperature (ºC)
} system_infos_t;

/*
 *   Initialize module
 */
void machine_init(void);
/*
 *   Run module, Should be called in the main loop
 *   Will only do interesting thing if machine_set_run() is called
 */
void machine_run(void);

void set_state_initializing(void);
void set_state_idle(void);
void set_state_running(void);
void set_state_error(void);

void task_initializing(void);
void task_idle(void);
void task_running(void);
void task_error(void);

/*
 * Trigger to run state machine,
 * this function should be used at a fixed frequency
 */
void machine_set_run(void);
/*
 * Set motor duty cycle that will be used when mahcine is in state running
 * \param D Motor Duty cycle (range 0.0 to 1.0)
 */
void machine_set_motor_duty(float D);
/*
 * Set motor on
 * \param motor_on represent motor_on switch
 */
void machine_set_motor_on(FunctionalState motor_on);
/*
 * Set dms
 * \param dms represent Dead Man Switch
 */
void machine_set_motor_dms(FunctionalState dms);
/*
 * Set reverse
 * \param reverse represent reverse Switch
 */
void machine_set_motor_reverse(FunctionalState reverse);

typedef struct
{
    // Trigger state machine
    uint32_t run;
    // Actual state
    state_machine_t state;
    // Internal representation of Pilot Inteface
    struct
    {
        float duty;
        FunctionalState dms;
        FunctionalState motor_on;
        FunctionalState reverse;
        uint32_t pot_zero_with;
    } motor;
} machine_t;

extern system_infos_t system_infos;
extern system_flags_t system_flags;
extern error_flags_t error_flags;

#endif // MACHINE_H