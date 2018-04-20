resistor(r1,power,n1).
resistor(r2,power,n2).
resistor(r3,power,n5).
resistor(r4,power,n6).

transistor(t1,n2,gnd,n1).
transistor(t2,n3,n4,n2).
transistor(t3,n5,gnd,n4).
transistor(t4,n6,gnd,n5).
transistor(t5,n7,gnd,n6).
transistor(t6,n8,gnd,n6).


inverter(INV,In,Out) :- transistor(T,In,gnd,Out),resistor(R,power,Out),INV=inv(T,R).
nand(NAND,In1,In2,Out) :- transistor(T1,In1,X,Out),transistor(T2,In2,gnd,X),resistor(R,power,Out),NAND=nand(T1,T2,R).
and(AND,In1,In2,Out) :- nand(NA,In1,In2,X),inverter(I,X,Out),AND =and(NA,I) .
nor(NOR,In1,In2,Out) :- transistor(T1,In1,gnd,Out),transistor(T2,In2,gnd,Out),resistor(R,power,Out),In1 \== In2,NOR = nor(T1,T2,R).
or(OR,In1,In2,Out) :- nor(NO,In1,In2,X),inverter(I,X,Out),or(NO,I).
