module lists_withMore_cbv.

typeOf (cons E1 E2) (list T) :- typeOf E1 T, typeOf E2 (list T).

typeOf (emptyList ) (list T).

typeOf (inr E) (sum T1 T2) :- typeOf E T2.

typeOf (inl E) (sum T1 T2) :- typeOf E T1.

typeOf (abs T1 R) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (tail E) (list T) :- typeOf E (list T).

step (tail (emptyList )) (myError ).

step (tail (cons E1 E2)) E2.

typeOf (head E) T :- typeOf E (list T).

step (head (emptyList )) (myError ).

step (head (cons E1 E2)) E1.

typeOf (case EE R1 R2) T :- typeOf EE (sum T1 T2), (pi x\ typeOf x T1 => typeOf (R1 x) T), (pi x\ typeOf x T2 => typeOf (R2 x) T).

step (case (inl EE) R1 R2) (R1 EE).

step (case (inr EE) R1 R2) (R2 EE).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

step (app (abs T R) E) (R E) :- value E.

value (cons E1 E2) :- value E1, value E2.

value (emptyList ).

value (inr E1) :- value E1.

value (inl E1) :- value E1.

value (abs T1 R2).

step (cons E1 E2) (cons E1' E2) :- step E1 E1'.

step (cons E1 E2) (cons E1 E2') :- step E2 E2', value E1.

step (inr E1) (inr E1') :- step E1 E1'.

step (inl E1) (inl E1') :- step E1 E1'.

step (tail E1) (tail E1') :- step E1 E1'.

step (head E1) (head E1') :- step E1 E1'.

step (case E1 R2 R3) (case E1' R2 R3) :- step E1 E1'.

step (app E1 E2) (app E1' E2) :- step E1 E1'.

step (app E1 E2) (app E1 E2') :- step E2 E2', value E1.

error (myError ).

typeOf (myError ) T.

step (cons E1 E2) E1 :- error E1.

step (cons E1 E2) E2 :- error E2.

step (inr E1) E1 :- error E1.

step (inl E1) E1 :- error E1.

step (tail E1) E1 :- error E1.

step (head E1) E1 :- error E1.

step (case E1 R2 R3) E1 :- error E1.

step (app E1 E2) E1 :- error E1.

step (app E1 E2) E2 :- error E2.

nstep E E.

nstep E1 E3 :- step E1 E2, nstep E2 E3.
