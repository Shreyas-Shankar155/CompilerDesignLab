%{
#include <stdio.h>
#include <stdlib.h>
int max_depth = 0;
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
S : S1 ';' S {$$=$3;}| 
	F S {$$= ($1>$2) ? $1 : $2; 
		if($$>max_depth) max_depth=$$;} | 
     {$$=0;} ; //empty production
	
F : FOR '(' D ';' C ';' S1 ')' F1  { $$=$9+1; } |
    FOR '(' ';' C ';' S1 ')' F1    { $$=$8+1; } |
    FOR '(' D ';' ';' S1 ')' F1    { $$=$8+1; } |
    FOR '(' ';' ';' S1 ')' F1      { $$=$7+1; } ;
F1 : S1 ';' {$$=0;} | '{' S '}' {$$=$2;} | F {$$=$1;} ;
S1 : A | E | D | ;
D : DATATYPE IDEN | DATATYPE IDEN '=' E ;    //declaration
A : IDEN '=' E ;   //T;  //assignment
E : E '+' E | E '-' E | E '*' E | E '/' E | '-''-'E | '+''+'E | E'+''+' | E'-''-' | T ;  
//expression
C : T RELOP T; //simple comparision
T : NUM | IDEN ;
%%

int main(){
FILE *input = fopen("input.c","r");
yyrestart(input);
yyparse();
printf("Max Depth: %d\n",max_depth);
if(max_depth<3)
	printf("Input is invalid\n");
else printf("Valid input\n");
return 0;
}

int yyerror(char *msg){
printf("\nYACC error: %s\n", msg);
exit(1);
}
