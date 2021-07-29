# MCU - Microcontroller Unit
Is a small computer on a single metal-oxide-semiconductor (MOS) integrated circuit (IC) chip.
A microcontroller contais one or more CPUs along with memory and programmable input/output periphericals.

## ATmega168
16k Flash memory.
8 bits.

## CPU
Processor cores.

## EEPROM
Slow to write.
There is not to much.
Nonvolatile.
Is byte-wise erasable.
Are seldom rewritten.
Used when only small amounts ate needed.

## Flash memory (16k)
Store compiled code.
Nonvolatile.
Is just one type of EEPROM.
Is block-wise erasable.
Constantly rewrttten.
Used when large amounts are needed.

## RAM or SRAM (RAM == DRAM)
Store temporary variables.
Volatile.


## Clocks
There are multiple clocks that are all derivated from the same commom timebase.
Internal RC oscillator (resistor-capacitor) as the master clock source.
It runs around 8 MHz.
The CPU clock is then divided down from the master clock, and runs at 1 MHz by default.

## Outputs
Digital.
Supply voltage level, VCC or GND.
If the voltage applied externally to the pin is greater than half the supply voltage, the chip sets a bit in an internal variable to one.

## Analog (doesn't have)
PWM (pulse width modulation), switching the digital pin state vary rapidly between high and low voltages so the average voltage is somewhere in the middle.

## Flash programmer
Is a device that allow us to program the flash memeory of a microcontroller.
By program, we mean we can transfer a program which we have written and compiled and send it the microcontroller for the microcontroller to execute the program.

## Serial communications built in

### USART 
For communication with desktop computer, radio modems, and GPS units.
Simillar to UART, but have sychronous comunication too.

### SPI - Serial Peripheral Interface
Synchronous serial communication.
Full duplex.
Good for ultra-fast communication over very short distances with peripherals like memories, ADCs, and DACs.
One master and multi slave communication.
Four-wire serial bus.
Different from SSI (Synchronous Serial Interface protocol).

### I2C/IIC
Like a small network, allowing you to connect up to 127 different sensors to the same couple of wires. 
   


## Interrupts

## Timers/counters

## ISP - In System Programming
An ISP header is typically a six-pin, 2x3 header, although some designs use eight-pin, 2x4 header. There are even some designs that use a ten-pin, 2x5 header. 
An ISP header provides a standardized interface for carrying programming signals from an external programmer to a chip.