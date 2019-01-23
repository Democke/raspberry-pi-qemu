use rppal::gpio::Gpio;
use std::thread;
use std::time::Duration;
use std::error::Error;
use rppal::system::DeviceInfo;

const LED_26: u8 = 26;
const LED_13: u8 = 13;
const LED_19: u8 = 19;

fn main() -> Result<(), Box<dyn Error>> {
    println!("Blinking an LED on a {}.", DeviceInfo::new()?.model());

    let mut pin_26 = Gpio::new()?.get(LED_26)?.into_output();
    let mut pin_13 = Gpio::new()?.get(LED_13)?.into_output();
    let mut pin_19 = Gpio::new()?.get(LED_19)?.into_output();

    // Blink the LED by setting the pin's logic level high for 500ms.
    pin_26.set_high();
    thread::sleep(Duration::from_millis(1000));
    pin_26.set_low();

    pin_13.set_high();
    thread::sleep(Duration::from_millis(1000));
    pin_13.set_low();

    pin_19.set_high();
    thread::sleep(Duration::from_millis(1000));
    pin_19.set_low();
    Ok(())
}
//13,19,26

