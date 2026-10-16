%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}
%token NUMBER
%%
input:
      /* empty */
    | input expression '\n' { printf("Result: %d\n", $2); }
    ;
expression:
      NUMBER                    { $$ = $1; }
    | expression expression '+' { $$ = $1 + $2; }
    | expression expression '*' { $$ = $1 * $2; }
    ;
%%
void yyerror(const char *s) { fprintf(stderr, "Invalid postfix expression\n"); }
int main(void) {
    printf("Enter postfix expressions, one per line (Ctrl+D to finish):\n");
    return yyparse();
}
