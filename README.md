# TypeSoundnessCertifier

Author: Matteo Cimini (mcimini@indiana.edu)
	<br />
Tool tested with Abella 2.0.2, 2.0.3, and 2.0.4

Quick usage: <br />
<ul>
<li> make 
<li> ./soundy 
</ul>
 <br />
Output: a successful message means that <br />
<ul>
<li> The tool has succesfully type checked the language specifications in the folder "repo" 
<li> The tool has automatically generated Abella files (.sig, .mod, and especially .thm) in the folder "generated" <br /> 
     These files contain the theorem and proof of type soundness together with all the related theorems. 
<li> Abella has succesfully proof-checked all the type soundness theorems generated <br /> 
     To be precise: the command "abella" runs to "Proof Completed" on all generated .thm in the folder "generated" <br />
     (* Important: you need the <a href="http://abella-prover.org">Abella proofs assistant</a> installed and "abella" must be in the $PATH *)  
<br />
</ul>

To clean: <br />
<ul>
<li> make cleanOnlyTool 
	<br /> (removes compilation files and executable) 
<li> make clean 
	<br />  (removes compilation files, executable, and Abella files in "generated") 
</ul>


# Examples of Spotted Design Mistakes in Languages.

Only a few relevant examples, acting on the file "<strong>fpl_cbv.mod</strong>" in the folder "<strong>repo</strong>": 
<br />(./soundy after each modification)
<ul>
	<li style="margin: 20px;"> Remove line 33: <strong> step (pred (zero )) (raise (zero )).</strong>
	<br /> Spotted error: <strong>pred</strong> (predecessor for natural numbers) does not eliminate <strong>zero</strong>, hence progress does not hold.
	<br />
<li style="margin: 20px;">  Replace line 33: <strong> step (pred (zero )) (raise (zero )).</strong>  with <strong> step (pred <strong style="color:red;">(tt)</strong>) (raise (zero )).</strong>	 
	<br /> Spotted error: <strong>pred</strong> is eliminator for natural numbers but here eliminates a boolean value. 
	<br /> <i>Notice that the type system of a logical framework may not spot this error because </i><strong>pred</strong><i> accepts an expression as argument and </i><strong>(tt)</strong><i> is an expression. This error can be spotted after our high-level classification of operators.</i>
	<br />
<li style="margin: 20px;">  Replace line 45: <strong> step (fst (pair E1 E2)) E1.</strong>  with <strong> step (fst (pair E1 E2)) <strong style="color:red;"> E2</strong></strong>. 
	<br /> Spotted error: Reduction rule is not type preserving because <strong>(fst (pair E1 E2))</strong> has the type of <strong>E1</strong>.
	<br />
<li style="margin: 20px;">  Remove line 133: <strong> % context app C e.</strong>
	<br /> Spotted error: the first argument of <strong>app</strong> is not an evaluation context, hence progress does not hold.
	<br />
<li style="margin: 20px;">  Replace line 129: <strong> % context cons E e.</strong> with <strong> % context cons E v.</strong>
	<br /> Spotted error: Context declarations contain circular dependencies, hence progress does not hold.
	<br />
<li style="margin: 20px;">  Replace line 21: <strong> typeOf (cons E1 E2) (list T) :- <strong style="color:red;">typeOf E1 T,</strong> typeOf E2 (list T).</strong> 
	<br /> with <strong >typeOf (cons E1 E2) (list T) :- typeOf E2 (list T).</strong>
	<br /> Spotted error: the typing rule does not assign a type to <strong>E1</strong>.
</ul>
