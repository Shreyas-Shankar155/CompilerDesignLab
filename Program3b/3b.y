%{
#include "stdio.h"
#include "stdlib.h"
int no_of_args=0;
extern int yylex(); //I need this fxn to modify input stream location
%}

%union{
char* str;
int num;
}
%token <num> NUM
%token <str> IDEN DATATYPE
%type <num> FDEFS
%left '+' '-'
%left '*' '/'

%%
F : DATATYPE IDEN '(' FDEFS ')' F1  
	{printf("\nFunction name: %s\nDatatype:%s\nNo. of args:%d\n",$2,$1,$4);
	no_of_args=0;};
F1 : ';' F2 | '{' S '}' F2 ;
F2 : F | ;  //either continue scanning for functions or stop
FDEFS : DATATYPE IDEN FDEFS1  {no_of_args++; $$=no_of_args; } // printf("\n%s %s",$1, $2);}
 	| {$$=0;};
FDEFS1 : ',' FDEFS 
	| {no_of_args=0;} ;
S : S1 ';' S | ;
S1 : A | D | E | ;
D : DATATYPE IDEN | DATATYPE A ;
A : IDEN '=' E ;
E : E '+' E | E '-' E | E '*' E | E '/' E | '-''-'E |'+''+'E | E'+''+' |E'-''-' | T;
T : NUM | IDEN;
%%

int main(){
FILE *input_file = fopen("example.c","r");
yyrestart(input_file);
yyparse();
}

int yyerror(char *msg)
{
printf("YACC error: %s\n",msg);
exit(1);
}
