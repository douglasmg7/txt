# Serial communication

### Asynchronous
No signal clock is sent.
Device using them must agree ahead of time on a data rate.
The two devices must also have clocks that are close to the same rate (baud rate configuration).
Inherently suited to communications between two, and only two devices.

### Sychronous
Signal clock is sent.

## SBUS

## IBUS

## PPM

## JTAG

## CAN

## MIDI

## USB

## RS-232
Old version of UART communication.
0s: +3V to +25V
1s: -3V to -25V



## USART 
For communication with desktop computer, radio modems, and GPS units.
Simillar to UART, but have sychronous comunication too.



## UART - Universal Asynchronous Receive Transmitter
Asynchronous / 1 to 1 / 20kbps / medium power / 15m distance.
Used by Arduino to upload the code / send data to the serial monitor.
Ad-Hoc topology
Bit Frame - Start and stop comunication.
0s: 0V
1s: 5v
TX and RX led will not flash when using port 0 and 1. Only when using USB port.


### Configuration
The two devices need have the same configuration.
Baud rate in seconds.
Data length in bits.
How is the start and the stop bit.

### Wire 2
TX
RX
GND

### Others pins
DTR - Data Terminal is Ready.
CTS - Clear To Receive (receive is clear to receive).



## SPI - Serial Peripheral Interface
Synchronous / duplex / 25Mbps / lower power / 20cm distance.
Full duplex.
Good for ultra-fast communication over very short distances with peripherals like memories, ADCs, and DACs.
One master and multi slave communication.
Different from SSI (Synchronous Serial Interface protocol).

### Wire 4+
CIPO (MISO) - Controller In Peripherical Out
COPI (MOSI) - Controller Out Peripherical In
SCK - Signal Clock
CS1 - Chip Select 1 (one for each peripherical device connected)
Cs2 - Chip Select 2



## I2C/IIC - Inter Integrated Circuit or TWI - Two Wire Interface
Synchronous / simplex / 1Mbps / medium power / 1m distance.
Allow multiple peripherical digital IC to communicate with one or more controller chip (multi-controller system).
Like a small network, allowing you to connect up to 127 different sensors to the same couple of wires. 
Support until 1080 peripherical devices.
Data

### Configuration
Data length in bits.

### Wire 2
SDA - Signal Data (implemented int the pin A4 too)
SCL - Signal Clock (implemented int the pin A5 too)

    
   


