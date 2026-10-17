%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
void yyerror(const char *s);
%}
%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%right '^'
%right UMINUS
%%
input:
      /* empty */
    | input line
    ;
line:
      '\n'
    | expression '\n' { printf("Result = %d\n", $1); }
    | error '\n' { printf("Invalid expression\n"); yyerrok; }
    ;
expression:
      NUMBER
    | '(' expression ')' { $$ = $2; }
    | '-' expression %prec UMINUS { $$ = -$2; }
    | expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression {
          if ($3 == 0) { yyerror("division by zero"); YYERROR; }
          $$ = $1 / $3;
      }
    | expression '%' expression {
          if ($3 == 0) { yyerror("modulo by zero"); YYERROR; }
          $$ = $1 % $3;
      }
    | expression '^' expression {
          if ($3 < 0) { yyerror("negative exponent"); YYERROR; }
          $$ = (int)pow((double)$1, (double)$3);
      }
    ;
%%
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int main(void) {
    printf("Desk calculator – enter one expression per line (Ctrl+D to finish)\n");
    return yyparse();
}
