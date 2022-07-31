#ifndef CONTROL_H
#define CONTROL_H 



typedef struct {
    float       dt_setpoint;   //duty cycle setpoint
    float       dt;            //duty cycle
    float       io;            //output current (A)
    float       vo;            //output voltage (V)
    float       vi;            //input voltage (V)
    float       temp;          //temperature (ºC)
}control_t;

void control_init(void);
void control_run(void);

void control_set_duty_setpoint(float dt_setpoint);

#endif