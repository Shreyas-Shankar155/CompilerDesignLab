%{
#include "y.tab.h"
extern YYSTYPE yylval;
%}

%%
("int"|"double"|"float"|"long"|"bool") return DATATYPE;
[a-zA-Z][a-zA-Z0-9_]* return IDEN;
[0-9]* return NUM;
[ \t\n] ;
. return yytext[0];
%%
