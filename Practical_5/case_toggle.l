%{
#include <stdio.h>
static char toggle_case(char ch) {
    if (ch >= 'a' && ch <= 'z') return (char)(ch - 'a' + 'A');
    if (ch >= 'A' && ch <= 'Z') return (char)(ch - 'A' + 'a');
    return ch;
}
%}
%%
[A-Za-z]    { putchar(toggle_case(yytext[0])); }
.           { ECHO; }
\n          { ECHO; }
%%
int main(void) {
    printf("Enter text (Ctrl+D to finish):\n");
    yylex();
    return 0;
}
int yywrap(void) { return 1; }
