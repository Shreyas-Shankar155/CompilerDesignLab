%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();

typedef char *string;

struct {
	string res, op1, op2;
	char op;
} code[100];
int idx = -1;

string addToTable(string, string, char);
void targetCode();
%}

%union {
	char *exp;
}

%token <exp> IDEN NUM
%type <exp> E T A

%left '+' '-'
%left '*' '/'

%%
S : S1 ';' S | ;
S1 : A | E | ;
A : IDEN '=' E { addToTable($1, $3, '='); } ;
E :  E '+' E {$$ = strdup(addToTable($1, $3, '+'));} 
  |  E '-' E {$$ = strdup(addToTable($1, $3, '-'));} 
  |  E '*' E {$$ = strdup(addToTable($1, $3, '*'));} 
  |  E '/' E {$$ = strdup(addToTable($1, $3, '/'));} 
  | '(' E ')' {$$ = $2;}
  | T {$$ = $1;};
T : IDEN {$$ = $1; }  | NUM {$$ = $1;};
%%

int yyerror(char *msg) {
	printf("\nError %s\n", msg);
	exit(1);
}

int main() {
	FILE *input = fopen("input.txt","r");
	yyrestart(input);
	yyparse();

	printf("\nTarget code:\n");
	targetCode();
}


string addToTable(string op1, string op2, char op) {
	if(op == '=') {
		idx++;
		code[idx].op = '=';
		code[idx].op1 = op2;
		code[idx].res = op1;
		return op1;
	}
	printf("%d",idx);
	idx++;
	string res = malloc(3);
	sprintf(res, "@%c", idx + 'A');

	code[idx].op1 = op1;
	code[idx].op2 = op2;
	code[idx].op = op;
	code[idx].res = res;
	return res;
}

void targetCode() {
	for(int i = 0; i <= idx; i++) {
		string instr;
		switch(code[i].op) {
		case '+': instr = "ADD"; break;
		case '-': instr = "SUB"; break;
		case '*': instr = "MUL"; break;
		case '/': instr = "DIV"; break;
		case '=' : printf("LOAD\t R1, %s\nSTORE\t %s, R1\n",code[i].op1,code[i].res); continue;
		}

		printf("LOAD\t R1, %s\n", code[i].op1);
		printf("LOAD\t R2, %s\n", code[i].op2);
		printf("%s\t R3, R1, R2\n", instr);
		printf("STORE\t %s, R3\n", code[i].res);
	}
}
