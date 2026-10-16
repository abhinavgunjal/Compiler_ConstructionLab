%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}
%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+*]        { return (unsigned char)yytext[0]; }
[ \t\r]+   ;
\n          { return '\n'; }
.           { return (unsigned char)yytext[0]; }
%%
int yywrap(void) { return 1; }
