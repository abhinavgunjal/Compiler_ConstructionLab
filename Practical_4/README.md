# Practical 4 – Arithmetic Expression Parser

Accepts integer expressions containing addition, multiplication, and parentheses.

Build:
```sh
yacc -d 04_parse.y
lex 04_lex.l
gcc y.tab.c lex.yy.c -o practical4 -ll
./practical4
```
