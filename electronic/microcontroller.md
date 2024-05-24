# MCU - Microcontroller Unit
Is a small computer on a single metal-oxide-semiconductor (MOS) integrated circuit (IC) chip.
A microcontroller contais one or more CPUs along with memory and programmable input/output periphericals.

## CMOS
Complementary metal–oxide–semiconductor (CMOS, pronounced "sea-moss", /siːmɑːs/, /-ɒs/) is a type of metal–oxide–semiconductor field-effect transistor (MOSFET) fabrication process that uses complementary and symmetrical pairs of p-type and n-type MOSFETs for logic functions.[1] CMOS technology is used for constructing integrated circuit (IC) chips, including microprocessors, microcontrollers, memory chips (including CMOS BIOS), and other digital logic circuits. CMOS technology is also used for analog circuits such as image sensors (CMOS sensors), data converters, RF circuits (RF CMOS), and highly integrated transceivers for many types of communication.

Two important characteristics of CMOS devices are high noise immunity and low static power consumption.[3] Since one transistor of the MOSFET pair is always off, the series combination draws significant power only momentarily during switching between on and off states. Consequently, CMOS devices do not produce as much waste heat as other forms of logic, like NMOS logic or transistor–transistor logic (TTL), which normally have some standing current even when not changing state. These characteristics allow CMOS to integrate a high density of logic functions on a chip. It was primarily for this reason that CMOS became the most widely used technology to be implemented in VLSI chips.

## AVR
AVR is a family of microcontrollers developed since 1996 by Atmel, acquired by Microchip Technology in 2016. These are modified Harvard architecture 8-bit RISC single-chip microcontrollers. AVR was one of the first microcontroller families to use on-chip flash memory for program storage, as opposed to one-time programmable ROM, EPROM, or EEPROM used by other microcontrollers at the time.

AVR stands for Alf and Vegard's RISC processor.

## ATmega328/328P
ATmega328/328P is an Advanced Virtual RISC (AVR) microcontroller. It supports 8-bit data processing. ATmega-328/328P has 32KB internal flash memory. ATmega328/328P has 1KB Electrically Erasable Programmable Read-Only Memory (EEPROM). This property shows if the electric supply supplied to the micro-controller is removed, even then it can store the data and can provide results after providing it with the electric supply. Moreover, ATmega-328 has 2KB Static Random Access Memory (SRAM). ATmega328/328P is a 28-Pin AVR Microcontroller, manufactured by Microchip, follows RISC Architecture and has a flash-type program memory of 32KB.

## PDIP Package
The IC have wafer format.

## TQFP/MLF Package
The IC have a square format.

## RISC
Reduced Instruction Set Computation

## Power supply pins
Vcc, GND and AVcc.
ATmega32 need a +5V.
AVcc stands for analog voltage.

## XTAL1, XTAL2
Used to connect a external cristal oscilator for use a different frequence that IC alredy have.

## RESET with a bar over
Reset MCU (active low)


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

## Interrupts

## Timers/counters

## ISP - In System Programming
An ISP header is typically a six-pin, 2x3 header, although some designs use eight-pin, 2x4 header. There are even some designs that use a ten-pin, 2x5 header. 
An ISP header provides a standardized interface for carrying programming signals from an external programmer to a chip.

## Pins
MISO (Master In Slave Out) - The slave line for sending data to the master.
MOSI (Master Out Slave In) - The master line for sending data to the peripherials.
SCK (Serial Clock) - The clock pulses, which synchronize data transmission generated by the master and one line specific for every device.
SS (Slave Select) or RESET - The pin on each device that the master can use to enable and disable specific devices.

When the RESET pin is at a postive voltage (the same voltage as VCC) the chip runs the program, when the RESET pin is at ground (the same voltage as GND) then the chip stops and listens for programming instructions on the programming pins.
