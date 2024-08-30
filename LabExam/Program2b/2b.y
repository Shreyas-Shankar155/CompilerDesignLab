%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%
S : E {printf("%d\n",$$);} ;
E : E '+' E {$$=$1+$3;}
  | E '-' E {$$=$1-$3;}
  | E '*' E {$$=$1*$3;}
  | E '/' E 	{
  		if($3==0)
  			{
  			printf("DIVIDE BY ZERO ERROR\n");
  			exit(1);
  			}
  		$$=$1/$3;
  		}
  | NUM {$$=$1;} ;
%%

int main(){
	printf("Enter arithmetic expression: ");
	yyparse();
}

int yyerror(char *msg){
	printf("YAAC Error: %s\n",msg);
	exit(1);
}
