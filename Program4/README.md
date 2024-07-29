Write a YACC program that reads C statements from an input file and converts them into intermediate code representation.  
(solution should output triples, quadruples and three address representation)  

Given a statement : a = b*c - 10  

Three address representation:  
t1 = b * c  
t2 = t1 - 10  
a = t2  

Quadruples representation:  (op, arg1, arg2, result)  
( *, b, c, t1 )      
( -, t1, 10, t2 )    
( =, t2, -, a )  


Triples representation: (op, arg1, arg2)  
(*, b, c)     
(-, (0), 10)   
(=, a, (1))  

The code generates three output files:  
.  quadruples.txt (stores quadruples)  
.  three_addr.txt (stores three address notation)  
. triples.txt (stores triples)  

Tokens:  
DATATYPE : Represents datatype  
IDEN : identifier  
NUM : number  

Grammar:  
S -> S1 ';' S | epsilon  
S1 -> A | D | E | epsilon  
D -> DATATYPE IDEN | DATATYPE A  
A -> IDEN '=' E | IDEN '=' E ',' A  
E -> E '+' E | E '-' E | E '*' E | E '/' E | '-' E | '(' E ')' | T  
T -> NUM | IDEN  
