%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
static int temp = 1;
%}
%union { int num; char *str; }
%token <num> NUM
%type <str> expr
%left '+' '-'
%left '*' '/'
%%
input:
    expr { printf("x = %s\n", $1); }
    ;
expr:
      NUM {
          $$ = malloc(24);
          if (!$$) { perror("malloc"); exit(EXIT_FAILURE); }
          snprintf($$, 24, "%d", $1);
      }
    | expr '+' expr {
          $$ = malloc(24);
          if (!$$) { perror("malloc"); exit(EXIT_FAILURE); }
          snprintf($$, 24, "t%d", temp++);
          printf("%s = %s + %s\n", $$, $1, $3);
      }
    | expr '-' expr {
          $$ = malloc(24);
          if (!$$) { perror("malloc"); exit(EXIT_FAILURE); }
          snprintf($$, 24, "t%d", temp++);
          printf("%s = %s - %s\n", $$, $1, $3);
      }
    | expr '*' expr {
          $$ = malloc(24);
          if (!$$) { perror("malloc"); exit(EXIT_FAILURE); }
          snprintf($$, 24, "t%d", temp++);
          printf("%s = %s * %s\n", $$, $1, $3);
      }
    | expr '/' expr {
          $$ = malloc(24);
          if (!$$) { perror("malloc"); exit(EXIT_FAILURE); }
          snprintf($$, 24, "t%d", temp++);
          printf("%s = %s / %s\n", $$, $1, $3);
      }
    | '(' expr ')' { $$ = $2; }
    ;
%%
void yyerror(const char *s) { fprintf(stderr, "Invalid expression: %s\n", s); }
int main(void) {
    printf("Enter an arithmetic expression:\n");
    return yyparse();
}
