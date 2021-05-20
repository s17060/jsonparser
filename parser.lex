%{
#include "string.h"
#include "y.tab.h"

char *new_str(const char *str);
void printError();

%}



NUMBER (-)?[0-9]*(\.[1-9][0-9]*)?
STRING \"[^"]*\"
LCURLY \{
RCURLY \}
LSQUARE \[
RSQUARE \]
COLON :
COMMA ,
NULL null|Null|NULL
BOOLEAN true|false|True|False|TRUE|FALSE
BLANKS [\t\n\r]+



%%

{BLANKS}	{printf("nextline\n");}
{LCURLY}	{printf("lcurly ");return LCURLY;}
{RCURLY}	{printf("rcurly ");return RCURLY;}
{STRING} 	{printf("string ");return STRING;}
{COLON}	{printf("colon ");return COLON;}
{COMMA} 	{printf("comma ");return COMMA;}
{LSQUARE} 	{printf("lsquare ");return LSQUARE;}
{RSQUARE} 	{printf("rsquare ");return RSQUARE;}
{BOOLEAN} 	{printf("boolean ");return BOOLEAN;}
{NUMBER} 	{printf("number ");return NUMBER;}
{NULL} 	{printf("null ");return WARNULL;}


%%

int yywrap() {
	return 1;
}



