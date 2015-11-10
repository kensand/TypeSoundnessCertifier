module stlc_par_tuples.

typeOf (abs R T1) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (tuple5 E1 E2 E3 E4 E5) (times5 T1 T2 T3 T4 T5) :- typeOf E1 T1, typeOf E2 T2, typeOf E3 T3, typeOf E4 T4, typeOf E5 T5.

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

typeOf (select1 E) T1 :- typeOf E (times5 T1 T2 T3 T4 T5).

typeOf (select2 E) T2 :- typeOf E (times5 T1 T2 T3 T4 T5).

typeOf (select3 E) T3 :- typeOf E (times5 T1 T2 T3 T4 T5).

typeOf (select4 E) T4 :- typeOf E (times5 T1 T2 T3 T4 T5).

typeOf (select5 E) T5 :- typeOf E (times5 T1 T2 T3 T4 T5).

step (app (abs R T) EE) (R EE).

step (select1 (tuple5 E1 E2 E3 E4 E5)) E1.

step (select2 (tuple5 E1 E2 E3 E4 E5)) E2.

step (select3 (tuple5 E1 E2 E3 E4 E5)) E3.

step (select4 (tuple5 E1 E2 E3 E4 E5)) E4.

step (select5 (tuple5 E1 E2 E3 E4 E5)) E5.

value (abs R1 T2).

value (tuple5 E1 E2 E3 E4 E5).

step (app E1 E2) (app E1' E2) :- step E1 E1'.

step (app E1 E2) (app E1 E2') :- step E2 E2', value E1.

step (select1 E1) (select1 E1') :- step E1 E1'.

step (select2 E1) (select2 E1') :- step E1 E1'.

step (select3 E1) (select3 E1') :- step E1 E1'.

step (select4 E1) (select4 E1') :- step E1 E1'.

step (select5 E1) (select5 E1') :- step E1 E1'.
