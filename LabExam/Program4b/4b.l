%{
#include "y.tab.h"
extern YYSTYPE yylval;
%}

%%
"if" {ECHO; return IF;}
"else" {ECHO; return ELSE;}
("int"|"float"|"bool"|"double"|"long") return DATATYPE;
[a-zA-Z][a-zA-Z0-9_]* {ECHO; return IDEN;}
[0-9]* {ECHO;return NUM;}
"=="|"!="|">"|"<"|">="|"<=" {ECHO;return RELOP;}
"!" return NOT;
"&&" return AND;
"||" return OR;
[ \t\n] ;
. {ECHO; return yytext[0];}
%%
