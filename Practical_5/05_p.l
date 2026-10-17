%{
#include <stdio.h>
static char change_case(char ch) {
    if (ch >= 'a' && ch <= 'z') return (char)(ch - 'a' + 'A');
    if (ch >= 'A' && ch <= 'Z') return (char)(ch - 'A' + 'a');
    return ch;
}
%}
%%
[A-Za-z]    { putchar(change_case(yytext[0])); }
%%
int main(void) {
    printf("Enter text (Ctrl+D to finish):\n");
    yylex();
    return 0;
}
int yywrap(void) { return 1; }
