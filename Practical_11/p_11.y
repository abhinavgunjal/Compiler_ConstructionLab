%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(const char *s);
static int temp_count = 1;
static char *new_temp(void) {
    char *s = malloc(20);
    if (!s) { perror("malloc"); exit(EXIT_FAILURE); }
    snprintf(s, 20, "t%d", temp_count++);
    return s;
}
%}
%union { char *str; }
%token <str> NUM
%type <str> expr term factor
%left '+' '-'
%left '*'
%%
input:
    expr { printf("Three-address result: %s\n", $1); }
    ;
expr:
      expr '+' term { $$ = new_temp(); printf("%s = %s + %s\n", $$, $1, $3); }
    | expr '-' term { $$ = new_temp(); printf("%s = %s - %s\n", $$, $1, $3); }
    | term { $$ = $1; }
    ;
term:
      term '*' factor { $$ = new_temp(); printf("%s = %s * %s\n", $$, $1, $3); }
    | factor { $$ = $1; }
    ;
factor:
      NUM { $$ = $1; }
    | '(' expr ')' { $$ = $2; }
    ;
%%
int yyerror(const char *s) {
    fprintf(stderr, "Invalid expression: %s\n", s);
    return 0;
}
int main(void) {
    printf("Enter an arithmetic expression: ");
    return yyparse();
}
