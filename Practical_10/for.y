%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}
%token FOR ID NUMBER LE GE EQ NE
%left '+' '-'
%left '*' '/'
%%
input:
      /* empty */
    | input line
    ;
line:
      '\n'
    | for_loop '\n' { printf("Valid FOR loop\n"); }
    | error '\n' { printf("Invalid FOR loop\n"); yyerrok; }
    ;
for_loop:
    FOR '(' initialization ';' condition ';' update ')' statement
    ;
initialization:
    ID '=' expression
    ;
condition:
      expression '<' expression
    | expression '>' expression
    | expression LE expression
    | expression GE expression
    | expression EQ expression
    | expression NE expression
    ;
update:
    ID '=' expression
    ;
statement:
      ';'
    | '{' '}'
    ;
expression:
      ID
    | NUMBER
    | '(' expression ')'
    | expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    ;
%%
void yyerror(const char *s) { (void)s; }
int main(void) {
    printf("Enter a for loop (example: for(i=0; i<10; i=i+1);):\n");
    return yyparse();
}
