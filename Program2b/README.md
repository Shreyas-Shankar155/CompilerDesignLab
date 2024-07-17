A YACC program to validate and evaluate an arithmetic expression containing operators +,-,*,/

'*' and '/' are left associative
'+' and '-' are left associative

S -> E
E -> E+E | E-E | E*E | E/E | num
