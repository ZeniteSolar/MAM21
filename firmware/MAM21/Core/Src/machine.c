#include "machine.h"
#include "utils.h"
#include "control.h"
#include "can_app.h"

/* Some global variables*/
static machine_t machine;
system_infos_t system_infos;
system_flags_t system_flags;
error_flags_t error_flags;


void machine_init(void)
{
    LOG_INFO("initializing machine");
    set_state_initializing();
}

void set_state_initializing(void)
{
    LOG_INFO("==> STATE INITIALIZING");
    control_clear();
    machine.state = STATE_INITIALIZING;
}

void set_state_idle(void)
{
    LOG_INFO("==> STATE IDLE");
    machine.state = STATE_IDLE;
}

void set_state_running(void)
{
    LOG_INFO("==> STATE RUNNING");
    machine.state = STATE_RUNNING;
}
void set_state_error(void)
{
    LOG_INFO("==> STATE ERROR");
    machine.state = STATE_ERROR;
}

void check_pot_zero(void){
    static const float error_tolerance = 0.01f;
    static uint32_t pot_zero_clk;
    if (machine.motor.duty >= error_tolerance){
        pot_zero_clk = 0;
    }

    if (++pot_zero_clk >= 10){
        machine.motor.pot_zero_with = 1;
        system_flags.pot_zero_width = 1;
    }else {
        machine.motor.pot_zero_with = 0;
        system_flags.pot_zero_width = 0;
    }
}

void machine_set_motor_duty(float D)
{
    machine.motor.duty = D;
}

void machine_set_motor_on(FunctionalState motor_on)
{
    machine.motor.motor_on = motor_on;
}

void machine_set_motor_dms(FunctionalState dms)
{
    machine.motor.dms = dms;
}

void machine_set_motor_reverse(FunctionalState reverse)
{
    machine.motor.reverse = reverse;
}

void task_initializing(void)
{
    control_set_enable_motor(DISABLE);
    set_state_idle();
}

void task_idle(void)
{
    control_set_enable_motor(DISABLE);
    check_pot_zero();

    if (system_flags.motor_on && system_flags.dms && machine.motor.pot_zero_with){
        set_state_running();
    }
}

void task_running(void)
{
    control_set_enable_motor(ENABLE);
    control_set_duty_target(machine.motor.duty);

    if (!system_flags.motor_on || !system_flags.dms){
        set_state_idle();
    }
}

void task_error(void)
{
    LOG_ERROR("error");
    set_state_idle();
}

void machine_set_run(void){
    machine.run = 1;
}

void machine_run(void)
{

    if (machine.run){
        machine.run = 0;
        can_task_run();
        control_run();
        HAL_GPIO_TogglePin(GPIOC, GPIO_PIN_15);
        switch (machine.state)
        {
        case STATE_INITIALIZING:
            task_initializing();
            break;
        case STATE_IDLE:
            task_idle();
            break;
        case STATE_RUNNING:
            task_running();
            break;
        default:
            LOG_WARN("Unrecognized machine state!");
        case STATE_ERROR:
            task_error();
            break;
        }
    }
}