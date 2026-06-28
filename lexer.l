%{//------------declarations-----------------//
#include <stdio.h>

void printkey(char *ptr){
	printf(" KEYWORD(%s) ", ptr);
}
%}
%option noyywrap
%%
%{
//---------------Rules---------------------//

//keywords
//1.data types
%}
"integer"	{printkey(yytext);}
"float"		{printkey(yytext);}
"char"		{printkey(yytext);}
%{//2.control words 
%}
"if"		{printkey(yytext);}
"else"		{printkey(yytext);}
"while"		{printkey(yytext);}
"for"		{printkey(yytext);}
"while"		{printkey(yytext);}

[A-Za-z_]([A-Za-z_]|[0-9])* 	{//identifier
		printf(" IDENTIFIER(%s) ", yytext);
		}
		
[0-9]+	{//just whole numbers
	printf(" DIGIT(%s) ", yytext);
}
[ \t\n]+ {//Ignore whitespaces, tabs, nextlines}
.	{// when no match is found! It is error
	printf( "Unrecognized character: %s\n", yytext );
}
%%
//---------auxiliary functions------------//
int main(){
	yylex();
return 0;
}
