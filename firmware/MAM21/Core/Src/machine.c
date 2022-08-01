#include "machine.h"
#include "utils.h"
#include "control.h"
#include "can_app.h"

/* Some global variables*/
machine_t machine;
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

void task_initializing(void)
{
    control_init();

    set_state_idle();
}

void task_idle(void)
{
    control_set_enable_motor(DISABLE);

    if (system_flags.motor_on && system_flags.dms && system_flags.pot_zero_width){
        set_state_running();
    }
}

void task_running(void)
{
    control_set_enable_motor(ENABLE);

    if (!system_flags.motor_on || !system_flags.dms){
        set_state_idle();
    }
}

void task_error(void)
{
    LOG_ERROR("error");
}

void machine_run(void)
{
    if (machine.run){
        
        can_task_run();
        control_run();

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