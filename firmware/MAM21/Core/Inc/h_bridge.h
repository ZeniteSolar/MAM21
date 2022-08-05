/**
 ******************************************************************************
 * @file    h_bridge.h
 * @brief   This file handles the H bridge logic and
 * controls how the switches must be controlled.
 ******************************************************************************
 */
#ifndef H_BRIDGE_H
#define H_BRIDGE_H

#include "stm32g4xx_hal.h"
#include "utils.h"

typedef enum
{
    H_BRIDGE_LEFT_CHANNEL = TIM_CHANNEL_1,
    H_BRIDGE_RIGHT_CHANNEL = TIM_CHANNEL_2,
} h_bridge_channel_t;

typedef struct
{
    TIM_HandleTypeDef *pwm_htim;
    struct
    {
        FunctionalState enable;
        FunctionalState reverse;
    } flags;
    float duty;

} h_bridge_t;
/*
 * Initialize H bridge
 * Initialize timers and it guarantees that the switches initialize turned off
 * \param pwm_htim Pwm Time Base Handle
 */
void h_bridge_init(TIM_HandleTypeDef *pwm_htim);

/*
 * Run the switches logic
 * Should be called in the Period Elapsed interrupt
 */
void h_bridge_run(void);

/*
 * Set duty cycle in the timer compare register.
 * Not to be confused with the duty cycle of the motor! this is the PWM in the channel.
 * Duty cycle is automatically inverted depending of the pwm_mode.
 * \param htim is the Pwm Time Base Handle
 * \param channel is the channel that D wil be applied
 * \param D duty cycle
 */
void h_bridge_set_pwm(TIM_HandleTypeDef *htim, h_bridge_channel_t channel, float D);

/*
 * Set duty cycle in the motor
 * Not to be confused with the duty cycle of the timer!
 * \param D duty cycle
 */
void h_bridge_set_duty_target(float D);
/*
 *  Reverse motor
 * \param reverse reverse motor
 */
void h_bridge_set_reverse_motor(FunctionalState reverse);

#endif