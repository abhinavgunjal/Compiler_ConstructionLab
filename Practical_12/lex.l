%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+      { yylval.num = atoi(yytext); return NUM; }
[+\-*/()]   { return (unsigned char)yytext[0]; }
[ \t\r\n]+ ;
.           { return (unsigned char)yytext[0]; }
%%
int yywrap(void) { return 1; }
