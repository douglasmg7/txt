# Microcontroller 
Is an integrated circuit (IC) device used for controlling other portions of an electronic system, usually via a microprocessor unit (MPU), memory, and some peripherals.

These devices are optimized for embedded applications that require both processing functionality and agile, responsive interaction with digital, analog, or electromechanical components.

# IC
Integrated Circuit.

# MCU - Microprocessor Unit
Is used interchangeably as it stands for “microcontroller unit”. You may also occasionally see “µC”

# DSP
A digital signal processor (or "DSP") is a microprocessor that is optimized for demanding computational tasks such as digital filtering, mathematical analysis of real-time signals, and data compression. A highly sophisticated microcontroller may be able to function as a replacement for a digital signal processor, but it is still considered a microcontroller if a significant portion of its internal circuitry is intended to control, monitor, and communicate with the surrounding system.

# CPU
Central Processing Unit

# ISR - Interrupt Service Routine
An interrupt causes program execution to “vector” to an interrupt service routine (ISR), and after the ISR has completed its tasks, the processor returns to the function that was executing when the interrupt occurred.

# Online IDE
https://www.onlinegdb.com/

# SWO (Serial Wire Output) of SWD interface.
    printf works over SWO pin.
    Only applicable to MCUs based on ARM cortex M3/M4/M7 or higher processors.

# SWD (Serial Wire Debug)
    Is a two wire protocol for accessing the ARM debug interface.
    2 pin (debug) + 1 pin (trace)
        SWDIO
        SWCLK
        SWO

# ITM unit
    Is a optional application-driven trace source that supports printf style debugging to trace operating system and application events,
    and generates diagnostic system information.

# Debug
    See proccessor memory, registers, half the processor, start and stop the processor, insert breakpoints, etc... 

# .elf
    A type of executable which stands for executable and linkable format.
    Which is used for debugging.

# .bin
# .hex
    A type of executable which are actullay pure binary executable.
    Which are used for production.

# Cross compilation
    Produces executable for a different atchitecture.
