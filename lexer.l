%{//------------declarations-----------------//
#include <stdio.h>
#include <math.h>
#include "parse.tab.h"
%}
%option noyywrap
%%
%{
//---------------Rules---------------------//

//keywords
//1.data types
%}
"load"		{yylval = 1;return LD;}
"store"		{yylval = 2;return ST;}
"add"		{yylval = 3;return AD;}
"halt"		{yylval = 0;return HT;}
%{/*
[A-Za-z_]([A-Za-z_]|[0-9])*	{//identifier
		printf(" IDENTIFIER(%s) ", yytext);
		}
*/
%}		
"["		{return '[';}
"]"		{return ']';}
[abcd]		{yylval = *yytext - 'a';return REG;}
[0-9]+		{//just whole numbers
		yylval = atoi(yytext);
		return ADR;
}

[ \t\n]+ 	{//ignore whitespaces, tabs, nextlines
}
.	{// when no match is found! It is error
	printf( "Unrecognized character: %s\n", yytext );
}
%%
