#define ADC_CHANNELS 4
#define ADC_PERIOD (0.0002 / ADC_CHANNELS)
#define PWM_COUNTER_TOP 159

volatile double timer[2] = {0, 0};          // {atual, passado}

volatile unsigned int adc_clock = 0;
volatile unsigned int machine_clock = 0;

volatile float vi = 0;
volatile float ii = 0;
volatile float vo = 0;
volatile float io = 0;

volatile float pi = 0;
volatile float po = 0;
volatile float eff = 0;
volatile float dt[2] = {0 , 0};

volatile float power = 0;
volatile unsigned char enable = 0;
volatile unsigned char regen = 0;
volatile unsigned char rev = 0;

void adc_interrupt(double *in, double *out)
{
    // raising edge of end_of_conversion signal
    static const unsigned char end_of_conversion_pin = 4;
    static unsigned char end_of_conversion = 0;
    if( (end_of_conversion == 0) && (in[end_of_conversion_pin] != 0)){

        static const unsigned char number_of_adc_channels = 4;
        static unsigned char adc_channel = 0;
        switch(adc_channel++){
            case 0:
                out[2] = vi = (in[0] * 5.0f) / 1023.0f;
                break;
            case 1:
                out[3] = ii = (in[1] * 5.0f) / 1023.0f;
                break;
            case 2:
                out[4] = vo = (in[2] * 5.0f) / 1023.0f;
                break;
            case 3:
                out[5] = io = (in[3] * 5.0f) / 1023.0f;
            default:
                adc_channel = 0;
                out[1] = machine_clock = 1;
                
                break;
        }
    }
    end_of_conversion = in[end_of_conversion_pin];
}

void machine_run(double *in, double *out)
{

    if(machine_clock){
        out[4] = pi = ii * vi;
        out[7] = po = io * vo;
        out[8] = eff = (pi > 0) ? po/pi : 0;
        out[9] = enable = (in[4] > 0.5f) ? 1 : 0;
        out[10] = regen = (in[5] > 0.5f) ? 1 : 0;
        out[11] = rev = (in[6] > 0.5f) ? 1 : 0;
        out[12] = power = in[7];


        // compute dt for each leg
        dt[0] = (enable & ~rev) * (power -regen + 1) / 2;
        dt[1] = (enable & rev) * (power -regen + 1) / 2;

        // apply outputs
        out[13] = dt[0] * PWM_COUNTER_TOP;
        out[14] = dt[1] * PWM_COUNTER_TOP;
    }
}


//-------------------------- RunSimUser Fcn -------------------------//

void RunSimUser(double t, double delt, 
    double *in, double *out, 
    int *pnError, char *szErrorMsg)
{

    // generate ADC clock
    timer[0] = t;
    if(timer[0] -timer[1] >= (ADC_PERIOD/2)){
        out[0] = adc_clock ^= 1;
        out[1] = machine_clock = 0;
        timer[1] = timer[0];
    }

    adc_interrupt(in, out);

    machine_run(in, out);

}