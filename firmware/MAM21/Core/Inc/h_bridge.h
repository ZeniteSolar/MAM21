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
 *
 *
 */
void h_bridge_set_pwm(TIM_HandleTypeDef *htim, uint32_t channel, float D);

void h_bridge_set_duty_target(float D);
void h_bridge_set_reverse_motor(FunctionalState reverse);

#endif