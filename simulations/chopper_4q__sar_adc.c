#define CONVERSION_CLOCK_PIN    4
#define END_OF_CONVERSION_PIN   4
#define NUMBER_OF_BITS          10
#define MAXIMUM_ADC_VOLTAGE     5


//-------------------------- RunSimUser Fcn -------------------------//

void RunSimUser(double t, double delt, 
    double *in, double *out, 
    int *pnError, char *szErrorMsg)
{

    static const unsigned char number_of_channels = 4;
    static unsigned char channel_select = 0;
    static unsigned char adc_clock_in = 0;

    // detect raising edge
    if((adc_clock_in == 0) && (in[CONVERSION_CLOCK_PIN]) != 0){

        // saturate
        float in_saturated = in[channel_select];
        if(in_saturated < 0) in_saturated = 0;
        if(in_saturated > MAXIMUM_ADC_VOLTAGE) in_saturated = MAXIMUM_ADC_VOLTAGE;

        // quantize, sample and hold
        static const double maximum_adc_value = pow(2, NUMBER_OF_BITS) -1;
        static const double delta =  MAXIMUM_ADC_VOLTAGE / maximum_adc_value;
        double out_saturated = floor(in_saturated / delta +0.5);

        // saturate
        if(out_saturated > maximum_adc_value) out_saturated = maximum_adc_value;
        out[channel_select] = out_saturated;

        // cycle between channels
        if(++channel_select == number_of_channels) channel_select = 0;

        out[END_OF_CONVERSION_PIN] = 1;

    }else if(adc_clock_in == 1) out[END_OF_CONVERSION_PIN] = 0;
    adc_clock_in =  in[CONVERSION_CLOCK_PIN];

}