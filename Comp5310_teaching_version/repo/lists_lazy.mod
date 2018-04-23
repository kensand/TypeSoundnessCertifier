module lists_lazy.

typeOf (emptyList ) (list T).

typeOf (cons E1 E2) (list T) :- typeOf E1 T, typeOf E2 (list T).

typeOf (head E) T :- typeOf E (list T).

step (head (emptyList )) (myError ).

step (head (cons E1 E2)) E1.

typeOf (tail E) (list T) :- typeOf E (list T).

step (tail (emptyList )) (myError ).

step (tail (cons E1 E2)) E2.

typeOf (myError ) T.

value (emptyList ).

value (cons E1 E2).
error (myError ).


% context head C.
% context tail C.
