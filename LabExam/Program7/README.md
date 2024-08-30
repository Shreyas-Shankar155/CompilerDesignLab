A YACC program that identifies function definition of C language.  
  
Tokens:  
NUM : number  
IDEN : identifier  
DATATYPE : recognizes valid datatype (including pointers)  
  
Important Variables:  
F : Function  
FDEFS : Function definition  
D : Declaration  
S : Statements  
A : Assignment  
E : Expression  
T : Token  
  
Grammar:  
  
F -> DATATYPE IDEN '(' FDEFS ')' F1  
F1 -> ';' F2 | '{' S '}' F2  
F2 -> F | ;  
FDEFS -> DATATYPE IDEN FDEFS1 | epsilon  
FDEFS1 -> ',' FDEFS | epsilon  
  
S -> S1 ';' S | epsilon  
S1 -> A | D | E | epsilon  
D -> DATATYPE IDEN | DATATYPE A  
A -> IDEN '=' E  
E -> E '+' E | E '-' E | E '*' E | E '/' E | '-''-'E | '+''+'E | E'+''+' | E'-''-' | T  
T -> NUM | IDEN  
  
Input: example.c file stored in same directory  
Output:  
Function name: main  
Datatype:int  
No. of args:0  
  
Function name: add  
Datatype:float  
No. of args:3  
  
Function name: print_msg  
Datatype:void  
No. of args:2  
