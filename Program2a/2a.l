%{
#include <stdio.h>
int pi, ni, pf, nf = 0;
%}

%%
[-][0-9]+[/][-][0-9]+ {pf++; printf(yytext);}
[-][0-9]+[/][+]?[0-9]+ {nf++; printf(yytext);}
[+]?[0-9]+[/][-][0-9]+ {nf++; printf(yytext);}
[+]?[0-9]+[/][+]?[0-9]+ {pf++; printf(yytext);}
[-][0-9]+[.][0-9]+ {nf++; printf(yytext);}
[+]?[0-9]+[.][0-9]+ {pf++; printf(yytext);}
[-][0-9]+ {ni++; printf(yytext);}
[+]?[0-9]+ {pi++; printf(yytext);}
. ;
%%

int main(){
yyin = fopen("numbers.txt","r+"); //feed numbers.txt into the input stream
yylex();
printf("No. of positive integers: %d\n",pi);
printf("No. of negative integers: %d\n",ni);
printf("No. of positive fractions: %d\n",pf);
printf("No. of negative fractions: %d\n",nf);
return 0;
}
