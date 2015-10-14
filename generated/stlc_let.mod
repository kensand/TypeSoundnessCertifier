module stlc_let.

typeOf (abs R) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

typeOf (let E R) T2 :- typeOf E T1, (pi x\ typeOf x T1 => typeOf (R x) T2).

step (app (abs R) EE) (R EE).

step (let V R) (R V) :- value V.

value (abs R1).

step (app E1 E2) (app E1' E2) :- step E1 E1'.

step (let E1 R2) (let E1' R2) :- step E1 E1'.
