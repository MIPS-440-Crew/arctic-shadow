%{
#include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]*    { yylval.str = strdup(yytext); return ID; }
[0-9]+                  { yylval.num = atoi(yytext); return INT; }
[ \t\n]                 ; /* ignore whitespace */
.                       { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}