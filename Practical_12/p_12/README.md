# Practical 12 – Variable Declaration Parser

Validates declarations using the types `int`, `float`, and `char`, with one or more comma-separated identifiers.

Build:
```sh
yacc -d p_12.y
lex p_12.l
gcc y.tab.c lex.yy.c -o declarations -ll
./declarations
```
