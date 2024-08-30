%{
#include <stdio.h>
#include <stdlib.h>
int count = 0;
%}

%token NUM IDEN DATATYPE

%left '+' '-'
%left '*' '/'
%%
S : S1 ';' S | ;
S1 : A | D | E | ;
D : DATATYPE A;
A : IDEN '=' E A1 {count++;} | 
	IDEN '[' NUM ']' A1  {count++;};
A1 : ',' A | ;
E : E '+' E | E '-' E | E '*' E | E '/' E | T;
T : NUM | IDEN;
%%

int main(){
printf("Enter input:\n");
yyparse();
printf("Number of variables declared : %d\n",count);
return 0;
}

int yyerror(char *msg)
{
printf("YACC error\n");
exit(1);
}
