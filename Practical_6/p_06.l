%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
[0-9]+ {
    long value = strtol(yytext, NULL, 10);
    printf("Decimal     : %ld\n", value);
    printf("Hexadecimal : %lX\n", value);
}
[ \t\r\n]+ ;
. { printf("Invalid input: %s\n", yytext); }
%%
int main(void) {
    printf("Enter a decimal number: ");
    yylex();
    return 0;
}
int yywrap(void) { return 1; }
