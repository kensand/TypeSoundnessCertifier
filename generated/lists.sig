sig lists.

kind term type.
kind typ type.

type list typ -> typ.
type cons term -> term -> term.
type emptyList term.
type tail term -> term.
type head term -> term.
type myError term.

type value term -> o.

type error term -> o.


type typeOf term -> typ -> o.

type step term -> term -> o.

type nstep term -> term -> o.
