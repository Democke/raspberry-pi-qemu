use rppal::gpio::Gpio;
use std::thread;
use std::time::Duration;
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    println!("Hello World!");
    let mut pin = Gpio::new()?.get(19)?.into_output();
    pin.set_high();
    thread::sleep(Duration::from_millis(500));
    pin.set_low();
    Ok(())
    }
    //13,19,26

