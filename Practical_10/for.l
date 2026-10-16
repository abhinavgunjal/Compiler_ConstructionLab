%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
"for"                       { return FOR; }
"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
[0-9]+                      { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*      { return ID; }
[ \t\r]+                   ;
\n                          { return '\n'; }
.                           { return (unsigned char)yytext[0]; }
%%
int yywrap(void) { return 1; }
