%{
#include "y.tab.h"
extern int yylval;
%}

%%
"for" return FOR;
"int"|"float"|"double"|"bool" return DATATYPE;
">"|"<"|">="|"<="|"=="|"!=" return RELOP;
[0-9]+ {yylval = atoi(yytext); return NUM;}
[a-zA-Z] {yylval = yytext[0]; return IDEN;}
[ \t] ; //ignore tabs and whitespace 
\n return 0; //ignore newline
. return yytext[0];
%%
