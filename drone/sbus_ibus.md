# SBUS vs IBUS

SBUS and IBUS are both digital protocols and for a digital protocol, you define two voltage values to represent an active state and one inactive state. This is done for every digital protocol.

You can specify that 0V is inactive and 1V is active (this is called active high). But you can also define that 0V is active and 1V is inactive (active low).

Many bus protocols are active low and SBUS is also such a protocol. The reason for this choice is that active low signals can handle noise better. This is probably the reason why Futaba designed SBUS this way.

The ARM chips used on the flight controllers have the hardware to decode serial signals (both SUBS and IBUS are serial protocols). This decoder also is built for active high or active low signals. If you want to decode an active low signal (SUBS) with a decoder that is built for active high you have to add an inverter between so that both "talk the same language". This is the case for the F4 chips since ARM did not include an inverter on the chip. For F3/F7 this problem does not exist since ARM included the inverter in the chip and the software can enable/disable the inverter.

You get similar performance from SBUS and IBUS since both are a serial protocol with comparable frame times.