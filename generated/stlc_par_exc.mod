module stlc_par_exc.

typeOf (abs R T1) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (excValue ) (excType ).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

typeOf (try E1 E2) T :- typeOf E1 T, typeOf E2 (arrow (excType ) T).

typeOf (raise E) T :- typeOf E (excType ).

step (app (abs R T) EE) (R EE).

step (try E1 E2) E1 :- value E1.

step (try (raise E1) E2) (app E2 E1).

value (abs R1 T2).

value (excValue ).

error (raise E1).

step (app E1 E2) (app E1' E2) :- step E1 E1'.

step (app E1 E2) (app E1 E2') :- step E2 E2', value E1.

step (try E1 E2) (try E1' E2) :- step E1 E1'.

step (raise E1) (raise E1') :- step E1 E1'.

step (app E1 E2) E1 :- error E1.

step (app E1 E2) E2 :- error E2.

step (raise E1) E1 :- error E1.
