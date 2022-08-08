#include "utils.h"

extern UART_HandleTypeDef huart1;

int _write(int fd, char *ptr, int len)
{
    HAL_UART_Transmit(&huart1, (uint8_t *)ptr, len, HAL_MAX_DELAY);
    return len;
}

static led_t led_green = {
    .name = LED_GREEN,
    .pin = LED0_Pin,
    .port = LED0_GPIO_Port,
    .prescaler = 0,
    .clock = 0};
static led_t led_red = {
    .name = LED_RED,
    .pin = LED1_Pin,
    .port = LED1_GPIO_Port,
    .prescaler = 0,
    .clock = 0};

void led_set_prescaler(led_name_t name, uint32_t prescaler)
{
    if (led_green.name == name)
    {
        led_green.prescaler = prescaler;
    }
    else if (led_red.name == name)
    {
        led_red.prescaler = prescaler;
    }
}
void led_blink(led_t *led)
{
    if (++led->clock >= (1000 * led->prescaler))
    {
        led->clock = 0;
        HAL_GPIO_TogglePin(led->port, led->pin);
    }
}
void led_run(void)
{
    led_blink(&led_green);
    led_blink(&led_red);
}