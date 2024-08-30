%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
S : A B ;
A : 'a' A 'b' 
  | ;
B : 'b' B 'c' 
  | ;
%%

int main(){
printf("Enter the string: ");
yyparse();
printf("Accepted\n");
}

int yyerror(){
printf("Invalid pattern!\n");
exit(1); //error code
}
