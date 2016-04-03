module stlc_cbv_unitt.

typeOf (abs R T1) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (unit ) (unitType ).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

step (app (abs R T) EE) (R EE) :- value EE.

value (abs R1 T2).

value (unit ).



% context app C e.
% context app v C.