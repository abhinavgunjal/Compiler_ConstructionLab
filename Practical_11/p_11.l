%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}
%%
[0-9]+      { yylval.str = strdup(yytext); return NUM; }
[+*()\-]    { return (unsigned char)yytext[0]; }
[ \t\r\n]+ ;
.           { return (unsigned char)yytext[0]; }
%%
int yywrap(void) { return 1; }
