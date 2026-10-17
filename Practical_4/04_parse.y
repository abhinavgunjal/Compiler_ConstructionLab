%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}
%token NUM
%%
E : E '+' T | T ;
T : T '*' F | F ;
F : '(' E ')' | NUM ;
%%
void yyerror(const char *s) { fprintf(stderr, "Invalid expression\n"); }
int main(void) {
    printf("Enter an arithmetic expression: ");
    if (yyparse() == 0) printf("Valid expression\n");
    return 0;
}
