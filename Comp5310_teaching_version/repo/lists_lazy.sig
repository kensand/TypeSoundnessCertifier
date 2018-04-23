sig lists_lazy.

kind term type.
kind typ type.

type value term -> o.

type error term -> o.

type typeOf term -> typ -> o.

type step term -> term -> o.

type nstep term -> term -> o.

type list typ -> typ.

type emptyList term.
type cons term -> term -> term.
type head term -> term.
type tail term -> term.
type myError term.