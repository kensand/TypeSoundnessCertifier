module stlc_par_listsIsNil.

typeOf (abs T1 R) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (emptyList ) (list T).

typeOf (cons E1 E2) (list T) :- typeOf E1 T, typeOf E2 (list T).

typeOf (tt ) (bool ).

typeOf (ff ) (bool ).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

step (app (abs T R) E) (R E).

typeOf (head E) T :- typeOf E (list T).

step (head (emptyList )) (myError ).

step (head (cons E1 E2)) E1.

typeOf (tail E) (list T) :- typeOf E (list T).

step (tail (emptyList )) (myError ).

step (tail (cons E1 E2)) E2.

typeOf (isnil E) (bool ) :- typeOf E (list T).

step (isnil (emptyList )) (tt ).

step (isnil (cons E1 E2)) (ff ).

typeOf (if E1 E2 E3) T :- typeOf E1 (bool ), typeOf E2 T, typeOf E3 T.

step (if (tt ) E1 E2) E1.

step (if (ff ) E1 E2) E2.

value (abs T1 R2).

value (emptyList ).

value (cons E1 E2) :- value E1, value E2.

value (tt ).

value (ff ).

error (myError ).

typeOf (myError ) T.



% context cons C v.
% context cons e C.
% context app C e.
% context app e C.
% context head C.
% context tail C.
% context isnil C.
% context if C e e.
