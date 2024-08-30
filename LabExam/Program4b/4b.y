%{
#include <stdio.h>
#include <stdlib.h>
int nesting = 0;
extern int yylex();
%}

%token IDEN NUM 
%token IF //ELSE
//%token AND OR NOT
%token RELOP
%token DATATYPE
//%left OR AND
//%left NOT
%left '+' '-'
%left '*' '/'

%%
S : S1 ';' S | I S | ;
I : IF '(' B ')' I1 {nesting++;};
I1 : S1 ';' | I | '{' S '}' ;
B :T RELOP T ; //B AND B | B OR B | NOT B | 
S1 : E | ;
E : E '+' E | E '-' E | E '*' E | E '/' E | T;
T : NUM | IDEN;
%%

int main(){
FILE *input_file = fopen("input.txt","r");
yyrestart(input_file);
yyparse();
printf("Nesting: %d\n", nesting);
return 0;
}

int yyerror(char *msg){
printf("\nYACC error: %s\n",msg);
exit(1);
}
