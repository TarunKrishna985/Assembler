%{/* Prologue*/
#include <stdio.h>
#include <stdlib.h>
#include "parse.tab.h"
//#include "encode.h"
extern int yylex(void);
int inst;
void yyerror(const char *);
%}
/* Bison Declarations*/
%token LD
%token ST
%token AD
%token HT
%token REG
%token ADR
%%
/*Bison Rules   */
/*check whether left or right recursion is better?*/
t: 
	%empty
	|s t
	;
s:
	LD REG '[' ADR ']' 	{inst=($1<<6)+($2<<4)+$4; printf("%d\n",inst);}
	|ST REG '[' ADR ']'	{inst=($1<<6)+($2<<4)+$4; printf("%d\n",inst);}
	|AD REG REG REG 	{inst=($1<<6)+($2<<4)+($3<<2)+$4;printf("%d\n",inst);}
	|HT			{inst=($1<<6);printf("%d\n",inst);}
	;
%%
/*Epilogue*/
void yyerror(const char *s) { /* 2. Add this implementation */
    fprintf(stderr, "Error: %s\n", s);
}
int main(){
/*	FILE *ptr;
	if(argc > 1){
		ptr = fopen(argv[1], "r");
		if(ptr == NULL) {
			printf("%s file not found",argv[1]);
			return 1;
		}
		else yyin = ptr;
	}
	int inst = 0;
*/	
	printf("Machine Code:\n");
	yyparse();
	return 0;
}
