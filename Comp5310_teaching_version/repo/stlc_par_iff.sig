sig stlc_par_iff.

kind term type.
kind typ type.

type value term -> o.

type error term -> o.

type typeOf term -> typ -> o.

type step term -> term -> o.

type nstep term -> term -> o.

type arrow typ -> typ -> typ.
type bool typ.

type abs typ -> (term -> term) -> term.
type tt term.
type ff term.
type app term -> term -> term.
type if term -> term -> term -> term.