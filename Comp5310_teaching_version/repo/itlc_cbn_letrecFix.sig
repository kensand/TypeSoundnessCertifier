sig itlc_cbn_letrecFix.

kind term type.
kind typ type.

type value term -> o.

type error term -> o.

type typeOf term -> typ -> o.

type step term -> term -> o.

type nstep term -> term -> o.

type arrow typ -> typ -> typ.

type abs (term -> term) -> term.
type app term -> term -> term.
type fix term -> term.
type letrec (term -> term) -> (term -> term) -> term.