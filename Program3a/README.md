Write a scanner-parse specification for simple language construct:  
recognize a nested (minimum 3 levels) FOR loop statement for C language.  
  
Tokens:  
RELOP : Relational operators  
NUM : number  
IDEN : identifier  
FOR : for loop identifier  
DATATYPE : recognizes valid datatypes (bool, int, float, double)  
  
Non-terminals:  
A : ASSIGNMENT  
D : DECLARATION  
S : STATEMENTS  
S1 : STATEMENT  
C : COMPARISION  
F : FOR Loop  
E : Expression  
T : Token (can be letter or number)  
  
F -> <FOR> '(' D ';' C ';' S1 ')' F1 | <FOR> '(' ';' C ';' S1 ')' F1 |<FOR> '(' D ';' ';' S1 ')'  
F1 | <FOR> '(' ';' ';' S1 ')' F1  
F1 -> S1 ';' | '{' S '}' | F   
S -> S1 ';' S | F S |   
S1 -> A | E | D |   
D -> <DATATYPE> <IDEN> | <DATATYPE> <IDEN> '=' E   
A -> <IDEN> '=' E   
E -> E '+' E | E '-' E | E '*' E | E '/' E | '-''-'E | '+''+'E | E'+''+' | E'-''-' | T   
C -> T <RELOP> T  
T -> <NUM> | <IDEN>   
  
  
OUTPUTS:  
Case 1)  
I/p: for(int y = 0; y>3; y++) for(int x = 6; x>10; --x) {int a = 3; for(float b = 1; b<25; b = b*a){}}  
O/p: No. of for loops: 3  
  
Case 2)  
for(;;) for(;;) for(;;) for(;;) for(;;);  
No. of for loops: 5  
  
