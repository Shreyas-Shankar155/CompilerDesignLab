%{
#include <stdio.h>
#include <stdlib.h>
int loop_count = 0;
%}

%token NUM IDEN
%token FOR
%token DATATYPE
%token RELOP
// %token COMP_RELOP
%left '+' '-'
%left '*' '/'

//declaration separate from assignment
%%
F : FOR '(' D ';' C ';' S1 ')' F1  {loop_count++;} |
    FOR '(' ';' C ';' S1 ')' F1 {loop_count++;} |
    FOR '(' D ';' ';' S1 ')' F1 {loop_count++;} |
    FOR '(' ';' ';' S1 ')' F1 {loop_count++;} ;
F1 : S1 ';' | '{' S '}' | F ;
S : S1 ';' S | F S | ;
S1 : A | E | D | ;
D : DATATYPE IDEN | DATATYPE IDEN '=' E ;    //declaration
A : IDEN '=' E ;   //T;  //assignment
E : E '+' E | E '-' E | E '*' E | E '/' E | '-''-'E | '+''+'E | E'+''+' | E'-''-' | T ;  
//expression
C : T RELOP T; //simple comparision
T : NUM | IDEN ;
%%

int main(){
yyparse();
printf("No. of for loops: %d\n",loop_count);
return 0;
}

int yyerror(char *msg){
printf("\nYACC error: %s\n", msg);
exit(1);
}
