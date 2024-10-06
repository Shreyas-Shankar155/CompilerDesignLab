%{
#include "y.tab.h"
extern int yylval;
int line_count=1;
%}

%%
"for" {yylval = line_count;return FOR;}
"int"|"float"|"double"|"bool" return DATATYPE;
">"|"<"|">="|"<="|"=="|"!=" return RELOP;
[0-9]+ {yylval = atoi(yytext); return NUM;}
[a-zA-Z] {yylval = yytext[0]; return IDEN;}
[ \t] ; //ignore tabs and whitespace 
\n line_count++;
. return yytext[0];
%%

//\n return 0; //ignore newline

