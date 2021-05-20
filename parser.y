%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char* yytext;
int yylex();
int yyerror(const char *s);
extern FILE* yyin;


%}

%token <number> NUMBER;
%token <string> STRING;
%token LCURLY RCURLY LSQUARE RSQUARE
%token COMMA COLON
%token WARNULL BOOLEAN

%union {
  char *string;
  double number;
}

%start whole

%%

whole:	object
    ;

object: parent
     	| STRING 
     	| NUMBER 
     	| array 
     	| BOOLEAN 
     	| WARNULL 
     	;
     
objects: object
	| objects COMMA object
	;

parent: LCURLY RCURLY
      	| LCURLY children RCURLY
      	;

children: child
      	| children COMMA child
        ;

child: STRING COLON object
      	;

array: LSQUARE RSQUARE 
     	| LSQUARE objects RSQUARE
     	;



%%

int yyerror(const char *s)
{
  printf("\n\n---Niepoprawna skladnia!!!---\n");
  return 1;
}

int
main(int argc, char *argv[])
{
  if(argc == 2)
  {
    if(!(yyin = fopen(argv[1],"r")))
    {
      return EXIT_FAILURE;
    }
  }
  return yyparse();
}
