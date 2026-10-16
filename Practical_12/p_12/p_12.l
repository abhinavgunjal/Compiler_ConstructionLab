%{
#include "y.tab.h"
%}
%%
"int"                   { return INT; }
"float"                 { return FLOAT; }
"char"                  { return CHAR; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
","                     { return ','; }
";"                     { return ';'; }
[ \t\r\n]+            ;
.                       { return (unsigned char)yytext[0]; }
%%
int yywrap(void) { return 1; }
