%{

#include <stdio.h>
#include <stdlib.h>
#include "main.tab.h"

%}

%option never-interactive
%option yylineno

%%

[a-zA-Z][a-zA-Z0-9]*	{ yylval = 0; return ID; }
[0-9]+			{ yylval = atoi(yytext); return INT; }
[=;+-/*()]			{ yylval = 0; return yytext[0]; }
[ \t\r\n]		; /* ignore whitespace */
.			{ fprintf(stderr, "Bad token on line %d: %c", yylineno, yytext[0]); exit(1); }

%%

int yywrap(void) {
    // no more input
    return 1;
}
