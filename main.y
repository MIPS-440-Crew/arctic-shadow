%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ID INT
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

stmt_list: /* empty */ | stmt_list stmt
stmt: expr ';' | ID '=' expr ';'

expr: INT
    | ID
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '-' expr %prec UMINUS
    | '(' expr ')'
    ;

%%

int main(void) {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "error: %s\n", s);
}