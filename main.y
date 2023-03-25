%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylineno;
extern int yylex();
void yyerror(const char * s);

%}

%token ID INT
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

stmt_list: stmt_list stmt | %empty

stmt: expr ';' { printf("STATEMENT "); }
    | ID '=' expr ';' { printf("ASSIGNMENT "); }

expr: INT { printf("INT "); }
    | ID { printf("ID "); }
    | expr '+' expr { printf("PLUS "); }
    | expr '-' expr { printf("MINUS "); }
    | expr '*' expr { printf("TIMES "); }
    | expr '/' expr { printf("DIVIDE "); }
    | '-' expr %prec UMINUS { printf("NEGATE "); }
    | '(' expr ')' { printf("PARENTHESIS "); }

%%

int main(void) {
    
    yyparse();
    
    // no errors
    printf("\nCompiled successfully\n");
    
    return 0;
}

void yyerror(const char * s) {
    fprintf(stderr, "error on line %d: %s\n", yylineno, s);
    exit(1);
}
