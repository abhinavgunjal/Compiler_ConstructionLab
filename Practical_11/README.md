# Practical 11 – Three Address Code Generation

This Flex/Yacc program parses arithmetic expressions and prints intermediate three-address instructions using temporary variables.

Build:
```sh
yacc -d p_11.y
lex p_11.l
gcc y.tab.c lex.yy.c -o practical11 -ll
./practical11
```
