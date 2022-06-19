#![no_main]
#![no_std]

use crate::hal::{
    fdcan::{
        config::NominalBitTiming,
        filter::{StandardFilter, StandardFilterSlot},
        frame::{FrameFormat, TxFrameHeader},
        id::StandardId,
        FdCan,
    },
    gpio::{GpioExt as _, Speed},
    nb::block,
    rcc::{Config, RccExt, SysClockSrc},
    stm32::Peripherals,
    time::U32Ext,
};
use defmt::*;
use defmt_rtt as _;
use embedded_hal::PwmPin;
use hal::{gpio::AF6, pwm::PwmExt};
use stm32g4xx_hal as hal;
// use panic_halt as _;
// use panic_reset as _;
use core::num::{NonZeroU16, NonZeroU8};
use cortex_m_rt::entry;
use panic_probe as _;

#[entry]
fn main() -> ! {
    info!("Start");

    info!("Init Clocks");

    let dp = Peripherals::take().unwrap();
    let _cp = cortex_m::Peripherals::take().expect("cannot take core peripherals");
    let rcc = dp.RCC.constrain();
    let mut rcc = rcc.freeze(Config::new(SysClockSrc::HSE(24.mhz())));

    info!("Split GPIO");

    let gpioa = dp.GPIOA.split(&mut rcc);
    let gpiob = dp.GPIOB.split(&mut rcc);
    let _gpioc = dp.GPIOC.split(&mut rcc);

    let mut pwm1 = {
        let dp = Peripherals::take().unwrap();
        let pin1 = gpioa.pa8.into_alternate::<AF6>();
        let pin1n = gpiob.pb13.into_alternate::<AF6>();

        dp
        .TIM1
        .pwm(pin1, 20.khz(), &mut rcc)
        .into_complementary(pin1n)
    };

    let mut pwm2 = {
        let dp = Peripherals::take().unwrap();
        let pin2 = gpioa.pa9.into_alternate::<AF6>();
        let pin2n = gpiob.pb14.into_alternate::<AF6>();

        dp
        .TIM1
        .pwm(pin2, 20.khz(), &mut rcc)
        .into_complementary(pin2n)
    };

    pwm1.set_duty(pwm1.get_max_duty() / 2);
    pwm2.set_duty(pwm2.get_max_duty() / 2);
    pwm1.enable();
    pwm2.enable();


    let mut can = {
        info!("Init CAN 1");
        let rx = gpioa.pa11.into_alternate().set_speed(Speed::VeryHigh);
        let tx = gpioa.pa12.into_alternate().set_speed(Speed::VeryHigh);

        info!("-- Create CAN 1 instance");
        let can = FdCan::new(dp.FDCAN1, tx, rx, &rcc);

        info!("-- Set CAN 1 in Config Mode");
        let mut can = can.into_config_mode();
        can.set_protocol_exception_handling(false);

        info!("-- Configure nominal timing");
        // APB1 (HSE): 24MHz, Bit rate: 125kBit/s, Sample Point 87.5%
        // Value was calculated with http://www.bittiming.can-wiki.info/
        // TODO: use the can_bit_timings crate
        let btr = NominalBitTiming {
            prescaler: NonZeroU16::new(12).unwrap(),
            seg1: NonZeroU8::new(13).unwrap(),
            seg2: NonZeroU8::new(2).unwrap(),
            sync_jump_width: NonZeroU8::new(1).unwrap(),
        };
        can.set_nominal_bit_timing(btr);

        info!("-- Configure Filters");
        can.set_standard_filter(
            StandardFilterSlot::_0,
            StandardFilter::accept_all_into_fifo0(),
        );

        info!("-- Current Config: {:#?}", can.get_config());

        // info!("-- Set CAN1 in to normal mode");
        // can.into_external_loopback()
        can.into_normal()
    };

    info!("Create Message Data");
    let mut buffer = [0xAAAAAAAA, 0xFFFFFFFF, 0x0, 0x0, 0x0, 0x0];
    info!("Create Message Header");
    let header = TxFrameHeader {
        len: 2 * 4,
        id: StandardId::new(0x1).unwrap().into(),
        frame_format: FrameFormat::Standard,
        bit_rate_switching: false,
        marker: None,
    };
    // info!("Initial Header: {:#X?}", &header);

    info!("Transmit initial message");
    block!(can.transmit(header, &mut |b| {
        let len = b.len();
        b[..len].clone_from_slice(&buffer[..len]);
    },))
    .unwrap();

    loop {
        if let Ok(rxheader) = block!(can.receive0(&mut |header, body| {
            // info!("Received Header: {:#X?}", &h);
            // info!("received data: {:X?}", &b);
            info!("Received: {:#?}, {:#?}", &header, &body);
            for (i, d) in body.iter().enumerate() {
                buffer[i] = *d;
            }
            header
        })) {
            block!(
                can.transmit(rxheader.unwrap().to_tx_header(None), &mut |body| {
                    let len = body.len();
                    body[..len].clone_from_slice(&buffer[..len]);
                    // info!("Transmit: {:X?}", b);
                    info!("Transmit: {:#?}", &body);
                })
            )
            .unwrap();
        }
    }
}

// same panicking *behavior* as `panic-probe` but doesn't print a panic message
// this prevents the panic message being printed *twice* when `defmt::panic` is invoked
#[defmt::panic_handler]
fn panic() -> ! {
    cortex_m::asm::udf()
}
