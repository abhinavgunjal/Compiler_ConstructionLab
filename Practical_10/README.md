# Practical 10 – FOR Loop Syntax Validation

Validates a simplified C-style `for` loop with initialization, condition, update, and an empty statement or empty block.

Build:
```sh
yacc -d for.y
lex for.l
gcc y.tab.c lex.yy.c -o practical10 -ll
./practical10
```
