sig iff.

kind term type.
kind typ type.

type bool typ.
type tt term.
type ff term.
type if term -> term -> term -> term.

type value term -> o.

type error term -> o.


type typeOf term -> typ -> o.

type step term -> term -> o.

type nstep term -> term -> o.
