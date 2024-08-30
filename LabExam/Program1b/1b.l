%{
#include "y.tab.h"
%}

%%
'a' return 'a';
'b' return 'b';
'c' return 'c';
\n return 0;
. return yytext[0];
%%
