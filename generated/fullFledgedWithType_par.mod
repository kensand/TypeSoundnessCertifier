module fullFledgedWithType_par.

typeOf (abs R T1) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (absT R2) (all R) :- (pi x\ typeOf (R2 x) (R x)).

typeOf (emptyList ) (list T).

typeOf (cons E1 E2) (list T) :- typeOf E1 T, typeOf E2 (list T).

typeOf (excValue ) (excType ).

typeOf (tt ) (bool ).

typeOf (ff ) (bool ).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

step (app (abs R T) EE) (R EE).

typeOf (appT E X) (R X) :- typeOf E (all R).

step (appT (absT R2) X) (R2 X).

typeOf (head E) T :- typeOf E (list T).

step (head (emptyList )) (raise (excValue )).

step (head (cons E1 E2)) E1.

typeOf (tail E) (list T) :- typeOf E (list T).

step (tail (emptyList )) (raise (excValue )).

step (tail (cons E1 E2)) E2.

typeOf (if E1 E2 E3) T :- typeOf E1 (bool ), typeOf E2 T, typeOf E3 T.

step (if (tt ) E1 E2) E1.

step (if (ff ) E1 E2) E2.

typeOf (fix E) T :- typeOf E (arrow T T).

step (fix V) (app V (fix V)) :- value V.

typeOf (let E R) T2 :- typeOf E T1, (pi x\ typeOf x T1 => typeOf (R x) T2).

step (let V R) (R V) :- value V.

typeOf (letrec R1 R2 T1) T2 :- (pi x\ typeOf x T1 => typeOf (R1 x) T1), (pi x\ typeOf x T1 => typeOf (R2 x) T2).

step (letrec R1 R2 T) (let (fix (abs R1 T)) R2).

typeOf (try E1 E2) T :- typeOf E1 T, typeOf E2 (arrow (excType ) T).

step (try E1 E2) E1 :- value E1.

step (try (raise E1) E2) (app E2 E1).

value (abs R1 T2).

value (absT R1).

value (emptyList ).

value (cons E1 E2) :- value E1, value E2.

value (excValue ).

value (tt ).

value (ff ).

step (cons E1 E2) (cons E1' E2) :- step E1 E1'.

step (cons E1 E2) (cons E1 E2') :- step E2 E2', value E1.

step (app E1 E2) (app E1' E2) :- step E1 E1'.

step (app E1 E2) (app E1 E2') :- step E2 E2'.

step (appT E1 T2) (appT E1' T2) :- step E1 E1'.

step (head E1) (head E1') :- step E1 E1'.

step (tail E1) (tail E1') :- step E1 E1'.

step (if E1 E2 E3) (if E1' E2 E3) :- step E1 E1'.

step (fix E1) (fix E1') :- step E1 E1'.

step (let E1 R2) (let E1' R2) :- step E1 E1'.

step (try E1 E2) (try E1' E2) :- step E1 E1'.

step (raise E1) (raise E1') :- step E1 E1'.

error (raise E1) :- value E1.

typeOf (raise E) T :- typeOf E (excType ).

step (cons E1 E2) E1 :- error E1.

step (cons E1 E2) E2 :- error E2.

step (app E1 E2) E1 :- error E1.

step (app E1 E2) E2 :- error E2.

step (appT E1 T2) E1 :- error E1.

step (head E1) E1 :- error E1.

step (tail E1) E1 :- error E1.

step (if E1 E2 E3) E1 :- error E1.

step (fix E1) E1 :- error E1.

step (let E1 R2) E1 :- error E1.

step (raise E1) E1 :- error E1.

nstep E E.

nstep E1 E3 :- step E1 E2, nstep E2 E3.
