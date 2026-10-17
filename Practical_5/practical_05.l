%{
#include <stdio.h>
%}
%%
[A-Z]   { putchar(yytext[0] + ('a' - 'A')); }
[a-z]   { putchar(yytext[0] - ('a' - 'A')); }
.       { ECHO; }
\n      { ECHO; }
%%
int main(void) {
    printf("Enter text (Ctrl+D to finish):\n");
    yylex();
    return 0;
}
int yywrap(void) { return 1; }
