%{
#include <stdio.h>
int yylex(void);
int yyerror(const char *s);
%}
%token INT FLOAT CHAR ID
%%
declaration:
    type identifier_list ';' { printf("Valid declaration\n"); }
    ;
type:
      INT
    | FLOAT
    | CHAR
    ;
identifier_list:
      ID
    | identifier_list ',' ID
    ;
%%
int main(void) {
    printf("Enter variable declaration: ");
    return yyparse();
}
int yyerror(const char *s) {
    (void)s;
    printf("Invalid declaration\n");
    return 0;
}
