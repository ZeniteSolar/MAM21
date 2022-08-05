#include "h_bridge.h"

h_bridge_t h_bridge;

void h_bridge_init(TIM_HandleTypeDef *pwm_htim)
{
    h_bridge.pwm_htim = pwm_htim;
    h_bridge_set_pwm(pwm_htim, TIM_CHANNEL_1, 0.0);
    h_bridge_set_pwm(pwm_htim, TIM_CHANNEL_2, 0.0);
    HAL_TIM_Base_Start_IT(pwm_htim);
    HAL_TIM_PWM_Start_IT(pwm_htim, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(pwm_htim, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(pwm_htim, TIM_CHANNEL_2);
    HAL_TIMEx_PWMN_Start(pwm_htim, TIM_CHANNEL_1);
    HAL_TIMEx_PWMN_Start(pwm_htim, TIM_CHANNEL_2);
}

uint32_t get_pwm_mode(TIM_HandleTypeDef *htim, h_bridge_channel_t channel)
{
    switch (channel)
    {
    case H_BRIDGE_LEFT_CHANNEL:
        return (htim->Instance->CCMR1 & TIM_CCMR1_OC1M_Msk) >> (TIM_CCMR1_OC1M_Pos - TIM_CCMR1_OC1M_Pos);
    case H_BRIDGE_RIGHT_CHANNEL:
        return (htim->Instance->CCMR1 & TIM_CCMR1_OC2M_Msk) >> (TIM_CCMR1_OC2M_Pos - TIM_CCMR1_OC1M_Pos);
    default:
        __builtin_unreachable();
    }
}

void h_bridge_set_pwm(TIM_HandleTypeDef *htim, h_bridge_channel_t channel, float D)
{
    if (D < 0)
        D = 0;
    else if (D > 1)
        D = 1;
    uint32_t top = __HAL_TIM_GET_AUTORELOAD(htim);

    // Invert inverted channels
    if (get_pwm_mode(htim, channel) == TIM_OCMODE_PWM2)
    {
        D = 1 - D;
    }

    __HAL_TIM_SET_COMPARE(htim, channel, (int)((top + 1) * D));
}

void h_bridge_run(void)
{
    static uint32_t cycle = 0;
    static uint32_t ncycle = 0;
    /*
    https://www.modularcircuits.com/blog/articles/h-bridge-secrets/h-bridge-control/

      | 0cycle | 1cycle
    Q1|DIR      |DT
    Q2|!DIR     |!DT
    Q3|!DT     |!DIR
    Q4|DT      |DIR
    Assuming Q1 = CH1,Q2 = !CH1 and Q3 = CH2,Q4 = !CH2
        | 0cycle | 1 cycle
    CH1 |DIR     | DT
    CH2 |!DT     | !DIR
    */
    if (cycle)
    {
        // HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, GPIO_PIN_SET);
        h_bridge_set_pwm(h_bridge.pwm_htim, H_BRIDGE_LEFT_CHANNEL, 0 == h_bridge.flags.reverse);
        h_bridge_set_pwm(h_bridge.pwm_htim, H_BRIDGE_RIGHT_CHANNEL, 1 - h_bridge.duty);
    }
    else
    {
        // HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, GPIO_PIN_RESET);
        h_bridge_set_pwm(h_bridge.pwm_htim, H_BRIDGE_LEFT_CHANNEL, h_bridge.duty);
        h_bridge_set_pwm(h_bridge.pwm_htim, H_BRIDGE_RIGHT_CHANNEL, 0 == !h_bridge.flags.reverse);
    }
    if (++ncycle > 3)
    {
        ncycle = 0;
        cycle = !cycle;
    }
}

void h_bridge_set_duty_target(float D)
{
    if (D < 0)
        D = 0;
    else if (D > 1)
        D = 1;

    h_bridge.duty = D;
}
void h_bridge_set_reverse_motor(FunctionalState reverse)
{
    h_bridge.flags.reverse = reverse;
}
