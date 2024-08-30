Write a YACC program that reads the C statements for an input file and converts them in quadruple three address intermediate code.   

Given a statement : a = b*c - 10  

Three address representation:  
t1 = b * c  
t2 = t1 - 10  
a = t2  

Quadruples representation:  (op, arg1, arg2, result)  
( *, b, c, t1 )      
( -, t1, 10, t2 )    
( =, t2, -, a )  

The code generates quadruples.txt (stores quadruples)  

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
