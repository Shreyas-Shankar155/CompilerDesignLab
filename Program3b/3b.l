%{
#include "y.tab.h"
#include "string.h"   //need function to duplicate string strdup()
extern YYSTYPE yylval;
%}

%%
("void"|"int"|"float"|"char"|"double"|"bool")[ ]*[\*]? {yylval.str = strdup(yytext); ECHO; return DATATYPE;}
[0-9]+ {yylval.num = atoi(yytext);ECHO; return NUM;}
[a-zA-Z][a-zA-Z0-9_]* {yylval.str = strdup(yytext); ECHO; return IDEN; }
[ \t] ; //ignore tabs and whitespace
\n ;
. return yytext[0];
%%

