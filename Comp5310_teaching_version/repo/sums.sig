sig sums.

kind term type.
kind typ type.

type value term -> o.

type error term -> o.

type typeOf term -> typ -> o.

type step term -> term -> o.

type nstep term -> term -> o.

type sum typ -> typ -> typ.

type inl term -> term.
type inr term -> term.
type case term -> (term -> term) -> (term -> term) -> term.