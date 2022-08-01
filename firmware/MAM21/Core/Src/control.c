#include "control.h"

control_t control;

void control_init(void)
{

}

void control_clear(void)
{

}

void control_set_duty_target(float D)
{
    control.duty_target = D;
}

void control_compute_rpm(void)
{
    //faking rpm measurement
    control.rpm = control.duty;
}

void control_set_enable_motor(FunctionalState enable)
{
    LOG_INFO("turning on motor");
    control.flags.enable = enable;
}

void control_set_reverse_motor(FunctionalState reverse)
{
    LOG_INFO("changing motor direction");
    control.flags.reverse = reverse;
}

void control_set_state_stopped(void)
{
    LOG_INFO("");
    control.state = CONTROL_STOPPED;
}

void control_set_state_stopping(void)
{
    control.state = CONTROL_STOPPING;
}

void control_set_state_forward(void)
{
    control.state = CONTROL_FORWARD;
}

void control_set_state_reverse(void)
{
    control.state = CONTROL_REVERSE;
}


void control_task_stopped(void)
{

    control.duty_setpoint = 0;

    if (control.flags.enable){
        if (control.flags.reverse)
            control_set_state_reverse();
        else 
            control_set_state_forward();
    }
}

void control_task_stopping(void)
{
    control.duty_setpoint = 0;
    
    control_compute_rpm();

    //if motor is stopped
    if (!(int)(100 * control.rpm)){
        control_set_state_stopped();
    }
}

void control_task_forward(void)
{
    control.duty_setpoint = control.duty_target;

    if (control.flags.reverse || !control.flags.enable){
        control_set_state_stopping();
    }
}

void control_task_reverse(void)
{
    control.duty_setpoint = control.duty_target;
    
    if (!control.flags.reverse || !control.flags.enable){
        control_set_state_stopping();
    }
}


void control_run(void)
{
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
    default:
        LOG_WARN("Unrecognized control state!");
    case CONTROL_STOPPING:
        control_task_stopping();
        break;
    }
}