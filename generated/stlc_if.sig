sig stlc_if.

kind typ, term type.

type arrow typ -> typ -> typ.
type bool typ.
type abs (term -> term) -> term.
type tt term.
type ff term.
type app term -> term -> term.
type if term -> term -> term -> term.

type value term -> o.

type error term -> o.


type typeOf term -> typ -> o.

type step term -> term -> o.
