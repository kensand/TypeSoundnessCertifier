module mycalculus.

typeOf (abs R) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (tt ) (bool ).

typeOf (ff ) (bool ).

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

typeOf (if E1 E2 E3) T :- typeOf E1 (bool ), typeOf E2 T, typeOf E3 T.

step (app (abs R) APPLIED) (R APPLIED) :- value APPLIED.

step (if (tt ) E1 E2) E1.

step (if (ff ) E1 E2) E2.

value (abs E1).

value (tt ).

value (ff ).

termPred (abs E1).

termPred (tt ).

termPred (ff ).

termPred (app E1 E2) :- termPred E1, termPred E2.

termPred (if E1 E2 E3) :- termPred E1, termPred E2, termPred E3.

nonvalue (app E1 E2) :- termPred E1, termPred E2.

nonvalue (if E1 E2 E3) :- termPred E1, termPred E2, termPred E3.

step (app E1 E2) (app E1' E2) :- step E1 E1'.

step (app E1 E2) (app E1 E2') :- step E2 E2'.

step (if E1 E2 E3) (if E1' E2 E3) :- step E1 E1'.

step (if E1 E2 E3) (if E1 E2' E3) :- step E2 E2'.

step (if E1 E2 E3) (if E1 E2 E3') :- step E3 E3'.
