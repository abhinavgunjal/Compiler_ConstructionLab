%{
#include <stdio.h>
%}
%%
[^\n]*COM\r?\n   { printf("Line ends with COM\n"); }
[^\n]*\r?\n      { printf("Line does not end with COM\n"); }
[^\n]*COM         { printf("Line ends with COM\n"); }
[^\n]+            { printf("Line does not end with COM\n"); }
%%
int main(void) {
    printf("Enter lines (Ctrl+D to finish):\n");
    yylex();
    return 0;
}
int yywrap(void) { return 1; }
