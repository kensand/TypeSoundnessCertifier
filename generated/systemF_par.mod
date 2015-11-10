module systemF_par.

typeOf (abs R T1) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (absT R2) (all R) :- (pi x\ typeOf (R2 x) (R x)).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

typeOf (appT E X) (R X) :- typeOf E (all R).

step (app (abs R T) EE) (R EE).

step (appT (absT R2) X) (R2 X).

value (abs R1 T2).

value (absT R1).

step (app E1 E2) (app E1' E2) :- step E1 E1'.

step (app E1 E2) (app E1 E2') :- step E2 E2', value E1.

step (appT E1 T2) (appT E1' T2) :- step E1 E1'.
