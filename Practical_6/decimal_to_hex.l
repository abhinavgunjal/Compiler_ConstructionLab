%{
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
%}
%%
[0-9]+ {
    char *end = NULL;
    errno = 0;
    unsigned long value = strtoul(yytext, &end, 10);
    if (errno != 0 || end == yytext || *end != '\0')
        printf("Number is out of range\n");
    else
        printf("Decimal: %s\nHexadecimal: %lX\n", yytext, value);
}
[ \t\r\n]+  ;
.           { printf("Invalid input: %s\n", yytext); }
%%
int main(void) {
    printf("Enter a non-negative decimal integer: ");
    yylex();
    return 0;
}
int yywrap(void) { return 1; }
