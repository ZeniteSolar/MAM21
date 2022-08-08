#ifndef UTILS_H
#define UTILS_H
#include <stdio.h>
#include "main.h"
// #ifdef __GNUC__
// #define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
// #else
// #define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
// #endif

#define LOG_INFO(x) \
    printf(x)
#define LOG_WARN(x) \
    printf(x);      \
    printf("\n")
#define LOG_ERROR(x) \
    printf(x);       \
    printf("\n")

typedef enum
{
    LED_GREEN,
    LED_RED
} led_name_t;

typedef struct
{
    const led_name_t name;
    const uint16_t pin;
    GPIO_TypeDef *port;
    uint32_t prescaler;
    uint32_t clock;
} led_t;

void led_run(void);
void led_set_prescaler(led_name_t name, uint32_t prescaler);

#endif