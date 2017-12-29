module stlc_cbn_sums.

typeOf (abs T1 R) (arrow T1 T2) :- (pi x\ typeOf x T1 => typeOf (R x) T2).

typeOf (inl E) (sum T1 T2) :- typeOf E T1.

typeOf (inr E) (sum T1 T2) :- typeOf E T2.

typeOf (app E1 E2) T2 :- typeOf E1 (arrow T1 T2), typeOf E2 T1.

step (app (abs T R) E) (R E).

typeOf (case E R1 R2) T :- typeOf E (sum T1 T2), (pi x\ typeOf x T1 => typeOf (R1 x) T), (pi x\ typeOf x T2 => typeOf (R2 x) T).

step (case (inl V) R1 R2) (R1 V) :- value V. 

step (case (inr V) R1 R2) (R2 V) :- value V. 

value (abs T1 R2).

value (inl E1) :- value E1.

value (inr E1) :- value E1.


% context inl C.
% context inr C.
% context app C e.
% context case C e e.