#![no_main]
#![no_std]

mod utils;

use defmt::info;
use fugit::{ExtU32, HertzU32, NanosDurationU32};

// These lines are part of our setup for debug printing.
// use panic_halt as _;
// use panic_reset as _;
use defmt_rtt as _;
use panic_probe as _;

use cortex_m::{
    self,
    asm::delay,
    delay::{self, Delay},
    interrupt::{free, Mutex},
    peripheral::NVIC,
    prelude::_embedded_hal_blocking_delay_DelayMs,
};
use cortex_m_rt::entry;

use stm32_hal2::{
    self,
    clocks::{Clk48Src, Clocks, InputSrc, PllCfg, PllSrc},
    dma::{Dma, DmaChannel, DmaInterrupt},
    gpio::{Edge, OutputType, Pin, PinMode, Port, Pull},
    low_power,
    pac::{self, tim1::dtr2::DTAE_R},
    timer::{OutputCompare, TimChannel, Timer, TimerConfig, TimerInterrupt},
};
use utils::U32Ext;

#[entry]
fn main() -> ! {
    let mut cp = cortex_m::Peripherals::take().unwrap();
    let mut dp = pac::Peripherals::take().unwrap();

    // This line is required to prevent the debugger from disconnecting on entering WFI.
    #[cfg(debug_assertions)]
    stm32_hal2::debug_workaround();

    // Create an initial clock configuration that uses the MCU's internal oscillator (HSI),
    // sets the MCU to its maximum system clock speed.
    let clock_cfg = Clocks {
        input_src: InputSrc::Pll(PllSrc::Hsi),
        pll: PllCfg {
            enabled: true,
            pllr_en: true,
            pllq_en: true,
            pllp_en: true,
            divm: stm32_hal2::clocks::Pllm::Div1,
            divn: 20,
            divr: stm32_hal2::clocks::Pllr::Div2,
            divq: stm32_hal2::clocks::Pllr::Div2,
            divp: stm32_hal2::clocks::Pllr::Div2,
        },
        hclk_prescaler: stm32_hal2::clocks::HclkPrescaler::Div2,
        apb1_prescaler: stm32_hal2::clocks::ApbPrescaler::Div1,
        apb2_prescaler: stm32_hal2::clocks::ApbPrescaler::Div1,
        clk48_src: Clk48Src::Pllq,
        hse_bypass: true,
        security_system: false,
        hsi48_on: false,
        boost_mode: true,
    };

    // Write the clock configuration to the MCU. If you wish, you can modify `clocks` above
    // in accordance with [its docs](https://docs.rs/stm32-hal2/latest/stm32_hal2/clocks/index.html),
    // and the `clock_cfg` example.
    clock_cfg.setup().unwrap();

    // Setup a delay, based on the Cortex-m systick.
    let mut delay = Delay::new(cp.SYST, clock_cfg.systick());

    let mut pwm_timer = Timer::pwm_hbridge_config(&clock_cfg, dp.TIM1, 12500.hertz(), 200.nanos());
    pwm_timer.enable();

    let mut dir = false;
    let mut dt = 0.;

    let mut ddt = 0.01;
    let mut cycle = false;
    let ncycles = 5;
    let mut cycles = 0;
    loop {
        pwm_timer.set_pwm(dt, dir, cycle);

        dt += ddt;
        if dt >= 1. || dt <= 0. {
            ddt = -ddt;
            defmt::println!("pwm: {:#?}, {:#?}, {:#?}", dt, dir, cycle);
        }

        cycles += 1;
        if cycles == ncycles {
            cycles = 0;
            cycle = !cycle;
        }

        delay.delay_ms(1_000);
    }
}

trait HBridge {
    // https://github.com/David-OConnor/stm32-hal/tree/main/examples
    fn pwm_hbridge_config(
        clock_cfg: &Clocks,
        tim: pac::TIM1,
        freq: HertzU32,
        deadtime: NanosDurationU32,
    ) -> Self;
    fn set_pwm(&mut self, dt: f32, dir: bool, cycle: bool);
}

impl HBridge for Timer<pac::TIM1> {
    fn pwm_hbridge_config(
        clock_cfg: &Clocks,
        tim: pac::TIM1,
        freq: HertzU32,
        deadtime: NanosDurationU32,
    ) -> Self {
        // References:
        // [RM0440 pg.1077 - "Advanced-control timers"](https://www.st.com/resource/en/reference_manual/rm0440-stm32g4-series-advanced-armbased-32bit-mcus-stmicroelectronics.pdf)
        // [AN4013 pg.26 - "Advanced features for motor control"](https://www.st.com/resource/en/application_note/an4013-stm32-crossseries-timer-overview-stmicroelectronics.pdf)
        // https://github.com/magiczny-kacper/STM32-H-Bridge/blob/main/Core/Src/main.c

        // Set up a PWM pin, ref for Alternate functions: https://www.st.com/resource/en/datasheet/stm32g431kb.pdf, pg 61
        let _pwm_ch1 = Pin::new(Port::A, 8, PinMode::Alt(6));
        let _pwm_ch2 = Pin::new(Port::A, 9, PinMode::Alt(6));
        let _pwm_ch1_n = Pin::new(Port::B, 13, PinMode::Alt(6));
        let _pwm_ch2_n = Pin::new(Port::B, 14, PinMode::Alt(6));

        // Set up a PWM timer that will output to PA0, run at 2400Hz in edge-aligned mode,
        // count up, with a 50% duty cycle.
        let mut pwm_timer = Timer::new_tim1(
            tim,
            freq.raw() as f32,
            TimerConfig {
                auto_reload_preload: true,
                one_pulse_mode: false,
                update_request_source: stm32_hal2::timer::UpdateReqSrc::OverUnderFlow,
                alignment: stm32_hal2::timer::Alignment::Center2, // FIXME: check this!
                capture_compare_dma: stm32_hal2::timer::CaptureCompareDma::Ccx,
                direction: stm32_hal2::timer::CountDir::Up,
            },
            &clock_cfg,
        );

        pwm_timer
            .set_complementary_polarity(TimChannel::C1, stm32_hal2::timer::Polarity::ActiveHigh);
        pwm_timer
            .set_complementary_polarity(TimChannel::C2, stm32_hal2::timer::Polarity::ActiveHigh);

        pwm_timer.set_preload(TimChannel::C1, true);
        pwm_timer.set_preload(TimChannel::C2, true);

        pwm_timer.set_output_compare(TimChannel::C1, OutputCompare::Pwm2);
        pwm_timer.set_output_compare(TimChannel::C2, OutputCompare::Pwm1);

        let (dtg, ckd) = utils::calculate_deadtime(clock_cfg.sysclk().hertz(), deadtime);
        pwm_timer.regs.cr1.modify(|_r, w| w.ckd().variant(ckd));
        pwm_timer.regs.bdtr.modify(|_r, w| {
            w.dtg()
                .variant(dtg)
                .lock()
                .variant(0b00) // "Lock configuration": Level 0
                .ossi()
                .variant(false) // "Off-state selection for idle mode": Hi-Z
                .ossr()
                .variant(false) // "Off-state selection for Run mode": Hi-Z
                .bke()
                .variant(false) // "Break enable": Disabled
                .aoe() // "Automatic output enable": MOE only by software
                .variant(false)
                .moe()
                .variant(false) // "Main output enable":
        });

        pwm_timer
    }

    fn set_pwm(&mut self, dt: f32, dir: bool, cycle: bool) {
        let dt = if dt < 0. { 0. } else { dt };
        let dt = if dt > 1. { 1. } else { dt };

        let max_dt = self.get_max_duty();

        let dt = (dt * (max_dt as f32)) as u16;
        let dir = (if dir { 1 } else { 0 }) * max_dt;

        let dt1 = if cycle { dir } else { dt };
        let dt2 = if cycle { dt } else { dir };

        self.set_duty(TimChannel::C1, dt1);
        self.set_duty(TimChannel::C2, dt2);
    }
}

// same panicking *behavior* as `panic-probe` but doesn't print a panic message
// this prevents the panic message being printed *twice* when `defmt::panic` is invoked
#[defmt::panic_handler]
fn panic() -> ! {
    cortex_m::asm::udf()
}
