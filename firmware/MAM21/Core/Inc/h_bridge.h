#ifndef H_BRIDGE_H
#define H_BRIDGE_H

#include "stm32g4xx_hal.h"
#include "utils.h"

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

void h_bridge_init(TIM_HandleTypeDef *pwm_htim);
void h_bridge_run(void);
void h_bridge_set_pwm(TIM_HandleTypeDef *htim, uint32_t channel, float D);

void h_bridge_set_duty_target(float D);
void h_bridge_set_reverse_motor(FunctionalState reverse);

#endif