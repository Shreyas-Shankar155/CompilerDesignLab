%{
#include <stdio.h>
int lines = 1, words = 0, digits = 0, chars = 0, spaces = 0;
%}

%%
[a-zA-Z]+ {chars+=yyleng; words++; }
[0-9] {digits++; chars++;}
[\n] lines++;
[ \t] {spaces++; chars++;}
. chars++; 
%%

int main(){
printf("Enter text: \n");
yylex();
printf("\nWords=%d\nCharacters=%d\nWhitespaces=%d\nDigits=%d\nLines=%d\n",
	words,chars,spaces,digits,lines);
}
