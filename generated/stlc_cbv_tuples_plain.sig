sig stlc_cbv_tuples_plain.

kind typ, term type.

type arrow typ -> typ -> typ.
type times5 typ -> typ -> typ -> typ -> typ -> typ.
type abs (term -> term) -> typ -> term.
type tuple5 term -> term -> term -> term -> term -> term.
type app term -> term -> term.
type select1 term -> term.
type select2 term -> term.
type select3 term -> term.
type select4 term -> term.
type select5 term -> term.

type value term -> o.

type error term -> o.


type typeOf term -> typ -> o.

type step term -> term -> o.