sig pairs_plain.

kind typ, term type.

type times typ -> typ -> typ.
type pair term -> term -> term.
type fst term -> term.
type snd term -> term.

type value term -> o.

type error term -> o.


type typeOf term -> typ -> o.

type step term -> term -> o.