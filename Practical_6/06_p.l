%{
#include <stdio.h>
static unsigned long parse_decimal(const char *str) {
    unsigned long value = 0;
    for (int i = 0; str[i] != '\0'; ++i)
        value = value * 10 + (unsigned long)(str[i] - '0');
    return value;
}
static void print_hex(unsigned long value) {
    static const char digits[] = "0123456789ABCDEF";
    if (value >= 16) print_hex(value / 16);
    putchar(digits[value % 16]);
}
%}
%%
[0-9]+ {
    unsigned long value = parse_decimal(yytext);
    printf("Decimal: %s\nHexadecimal: ", yytext);
    print_hex(value);
    putchar('\n');
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
