resistor(power,n1).
resistor(power,n2).
resistor(power,n5).

transistor(n2,gnd,n1).
transistor(n3,n4,n2).
transistor(n5,gnd,n4).
transistor(n6,gnd,n5).

inverter(In,Out) :- transistor(In,gnd,Out),resistor(power,Out).
nand(In1,In2,Out) :- transistor(In1,X,Out),transistor(In2,gnd,X),resistor(power,Out).
and(In1,In2,Out) :- nand(In1,In2,X),inverter(X,Out).
nor(In1,In2,Out) :- transistor(In1,gnd,Out),transistor(In2,gnd,Out),resistor(power,Out).
or(In1,In2,Out) :- nor(In1,In2,X),inverter(X,Out).
