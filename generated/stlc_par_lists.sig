sig stlc_par_lists.

kind typ, term type.

type arrow typ -> typ -> typ.
type list typ -> typ.
type abs (term -> term) -> term.
type emptyList term.
type cons term -> term -> term.
type app term -> term -> term.
type head term -> term.
type myError term.

type value term -> o.

type error term -> o.


type typeOf term -> typ -> o.

type step term -> term -> o.