module stlc_cbn_iff_par.

typeOf (abs R T1) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (tt ) (bool ).

typeOf (ff ) (bool ).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

step (app (abs R T) EE) (R EE).

typeOf (if E1 E2 E3) T :- typeOf E1 (bool ), typeOf E2 T, typeOf E3 T.

step (if (tt ) E1 E2) E1.

step (if (ff ) E1 E2) E2.

value (abs R1 T2).

value (tt ).

value (ff ).

step (app E1 E2) (app E1' E2) :- step E1 E1'.

step (if E1 E2 E3) (if E1' E2 E3) :- step E1 E1'.

step (if E1 E2 E3) (if E1 E2' E3) :- step E2 E2'.

step (if E1 E2 E3) (if E1 E2 E3') :- step E3 E3'.
