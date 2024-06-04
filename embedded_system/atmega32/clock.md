# Clock signals
Five options.
Multiplexed by clock multiplexer.
Clock multiplexer provide source to Atmega32 Clock Control Unit.

## Clock options
Need be multiplexed using the fuse bits:
cksel3 to cksel0
ckopt, if using external crystal

### External 
More used
XTAL1, XTAL2
Used to connect a external cristal oscilator for use a different frequence that IC alredy have.

### Calibrated Internal RC Osciallator

### External RC Osciallato 

### External Low Frequence Crystal

### External Crystal/Ceramic osckillator

## WDT - What Dog Timer
Have a separeted oscilator, know as Watch Dog Oscillator.

## Reset Circuit
Receive signal from source clock (clock multiplexer and watch dog oscilator)
