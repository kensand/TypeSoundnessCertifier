sig stlc_cbv_recursive.

kind term type.
kind typ type.

type value term -> o.

type error term -> o.

type typeOf term -> typ -> o.

type step term -> term -> o.

type nstep term -> term -> o.

type arrow typ -> typ -> typ.
type mu (typ -> typ) -> typ.

type abs typ -> (term -> term) -> term.
type app term -> term -> term.
type fold term -> (typ -> typ) -> term.
type unfold term -> term.