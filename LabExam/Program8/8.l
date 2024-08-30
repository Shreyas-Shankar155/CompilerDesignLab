%{
#include <string.h>
#include "y.tab.h"
%}


%%

[a-zA-Z_][a-zA-Z_0-9]* {
ECHO;
	yylval.exp = strdup(yytext);
	return IDEN;
	}
[0-9]+ {ECHO;
	yylval.exp = strdup(yytext);
	return NUM;
	}
[ \t\n] ;
. return yytext[0];

%%
