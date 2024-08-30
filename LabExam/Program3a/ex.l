%{
#include "string.h"
int count=0;
%}

%%
"/*"[^*]*"*/" 	{
	   	int len = yyleng;
		for(int i=1; i<len; i++)
			if(yytext[i]=='\n')
				count++;
		count++; //by default, add 1
		}
"//".* count++;

%%

int main(){
	yyin = fopen("input.c","r");
	yyout = fopen("output.c","w");
	yylex();
	printf("Number of commented lines: %d\n",count);
}

int yywrap(){
return 1;
}
