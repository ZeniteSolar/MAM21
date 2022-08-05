#include "machine.h"
#include "utils.h"
#include "control.h"
#include "can_app.h"

/* Some global variables*/
static machine_t machine;
system_infos_t system_infos;
system_flags_t system_flags;
error_flags_t error_flags;

/*
**  PRIVATE FUNCTIONS
*/

static void set_state_initializing(void);
static void set_state_idle(void);
static void set_state_running(void);
static void set_state_error(void);

/*
 * States of the machine
 */
// Initialize the machine
static void task_initializing(void);
// In this state, the motor is waiting for the boot procedure
static void task_idle(void);
// In this state, the motor is ready to run
static void task_running(void);
// Error state
static void task_error(void);

// Checks if the motor potentiometer was in the minimum for a while
static void check_pot_zero(void);

static void set_state_initializing(void)
{
    LOG_INFO("==> STATE INITIALIZING");
    control_clear();
    machine.state = STATE_INITIALIZING;
}

static void set_state_idle(void)
{
    LOG_INFO("==> STATE IDLE");
    machine.state = STATE_IDLE;
}

static void set_state_running(void)
{
    LOG_INFO("==> STATE RUNNING");
    machine.state = STATE_RUNNING;
}
static void set_state_error(void)
{
    LOG_INFO("==> STATE ERROR");
    machine.state = STATE_ERROR;
}

static void check_pot_zero(void)
{
    static const float error_tolerance = 0.01f;
    static uint32_t pot_zero_clk;
    if (machine.motor.duty >= error_tolerance)
    {
        pot_zero_clk = 0;
    }

    if (++pot_zero_clk >= 10)
    {
        machine.motor.pot_zero_with = 1;
        system_flags.pot_zero_width = 1;
    }
    else
    {
        machine.motor.pot_zero_with = 0;
        system_flags.pot_zero_width = 0;
    }
}

static void task_initializing(void)
{
    control_set_enable_motor(DISABLE);
    set_state_idle();
}

static void task_idle(void)
{
    control_set_enable_motor(DISABLE);
    check_pot_zero();

    if (system_flags.motor_on && system_flags.dms && machine.motor.pot_zero_with)
    {
        set_state_running();
    }
}

static void task_running(void)
{
    control_set_enable_motor(ENABLE);
    control_set_duty_target(machine.motor.duty);

    if (!system_flags.motor_on || !system_flags.dms)
    {
        set_state_idle();
    }
}

static void task_error(void)
{
    LOG_ERROR("error");
    set_state_idle();
}

/*
**  PUBLIC FUNCTIONS
*/
void machine_init(void)
{
    LOG_INFO("initializing machine");
    set_state_initializing();
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

void machine_set_run(void)
{
    machine.run = 1;
}

void machine_run(void)
{

    if (machine.run)
    {
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