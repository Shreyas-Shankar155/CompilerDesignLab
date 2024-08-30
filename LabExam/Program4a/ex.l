%{
#include <string.h>
int iden = 0, keyword = 0, op = 0;
void process(char *str, int len);
char arr[32][10] = {"void","int","return","long","bool","if","else",
 			"for", "while", "do", "double","float"};
//above is a list of keywords
struct{
int size;
char val[100][33];  //identifiers have max length of 33
} S; //store identifiers here
%}

%%
\".*\" printf("Literal\n");
[+\*\-/%] op++;
[a-zA-Z][a-zA-Z0-9_]* process(yytext, yyleng);
^#.*$ //ignore macros
.
%%

int main(){
	S.size = 0;
	yyin = fopen("input.c","r");
	yylex();
	printf("No. of keywords:%d\n",keyword);
	printf("No. of identifiers:%d\n",iden);
	printf("No. of operators:%d\n",op);
}

void process(char *str, int len){
	int i=0;
	for(i=0; i<13; i++) //check if matched string is keyword or not
		if(strcmp(arr[i],str)==0) 
			{
			keyword++;
			return;
			}	
	for(i=0; i<S.size; i++) //check if identifier is already in list or not
		if(strcmp(S.val[i],str) == 0)
			return;			
	strcpy(S.val[i], str); //copy str into S.val[i]
	S.size++;
	iden++;
}
