#include "control.h"

static control_t control;

/*
**  PRIVATE FUNCTIONS
*/
static void control_set_state_stopped(void);
static void control_set_state_stopping(void);
static void control_set_state_forward(void);
static void control_set_state_reverse(void);

static void control_task_stopped(void);
static void control_task_stopping(void);
static void control_task_forward(void);
static void control_task_reverse(void);

static void control_compute_duty(void);
static void control_compute_rpm(void);

static void control_compute_duty(void)
{
    static const float pos_step = 0.005f;
    static const float neg_step = -0.005f;
    static const float error_tolerance = 1.01 * pos_step;

    float error = control.duty_setpoint - control.duty;

    float step = (error > 0) ? pos_step : neg_step;

    if (fabsf(error) > error_tolerance)
    {
        control.duty += step;
    }
    else
    {
        control.duty = control.duty_setpoint;
    }

    h_bridge_set_duty_target(control.duty);
}

static void control_compute_rpm(void)
{
    // faking rpm measurement
    control.rpm = control.duty;
}

static void control_set_state_stopped(void)
{
    led_set_prescaler(LED_RED, 2000);
    LOG_INFO("==> State stopped");
    control.state = CONTROL_STOPPED;
}

static void control_set_state_stopping(void)
{
    led_set_prescaler(LED_RED, 1000);
    LOG_INFO("==> State stopping");
    control.state = CONTROL_STOPPING;
}

static void control_set_state_forward(void)
{
    led_set_prescaler(LED_RED, 250);
    LOG_INFO("==> State forward");
    h_bridge_set_reverse_motor(DISABLE);
    control.state = CONTROL_FORWARD;
}

static void control_set_state_reverse(void)
{
    led_set_prescaler(LED_RED, 250);
    LOG_INFO("==> State reverse");
    h_bridge_set_reverse_motor(ENABLE);
    control.state = CONTROL_REVERSE;
}

static void control_task_stopped(void)
{

    control.duty_setpoint = 0;

    if (control.flags.enable)
    {
        if (control.flags.reverse)
            control_set_state_reverse();
        else
            control_set_state_forward();
    }
}

static void control_task_stopping(void)
{
    const float minimum_rpm = 0.001;
    control.duty_setpoint = 0;

    control_compute_rpm();

    // if motor is stopped
    if (control.rpm <= minimum_rpm)
    {
        control_set_state_stopped();
    }
}

static void control_task_forward(void)
{
    control.duty_setpoint = control.duty_target;

    if (control.flags.reverse || !control.flags.enable)
    {
        control_set_state_stopping();
    }
}

static void control_task_reverse(void)
{
    control.duty_setpoint = control.duty_target;

    if (!control.flags.reverse || !control.flags.enable)
    {
        control_set_state_stopping();
    }
}

/*
**  PUBLIC FUNCTIONS
*/

void control_init(TIM_HandleTypeDef *pwm_htim)
{
    control.duty_setpoint = 0;
    control.duty = 0;
    h_bridge_init(pwm_htim);
    control_set_state_stopping();
}

void control_clear(void)
{
    control.duty_setpoint = 0;
    control.flags.enable = DISABLE;
}

void control_set_duty_target(float D)
{
    control.duty_target = D;
}

void control_set_enable_motor(FunctionalState enable)
{
    control.flags.enable = enable;
}

void control_set_reverse_motor(FunctionalState reverse)
{
    LOG_INFO("changing motor direction");
    control.flags.reverse = reverse;
}

void control_run(void)
{
    control_compute_duty();
    printf("D_set: %d D: %d", (int)(100 * control.duty_setpoint), (int)(100 * control.duty));
    printf("\n");
    switch (control.state)
    {
    case CONTROL_FORWARD:
        control_task_forward();
        break;
    case CONTROL_REVERSE:
        control_task_reverse();
        break;
    case CONTROL_STOPPED:
        control_task_stopped();
        break;
    default:
        LOG_WARN("Unrecognized control state!");
    case CONTROL_STOPPING:
        control_task_stopping();
        break;
    }
}