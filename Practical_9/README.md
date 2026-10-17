# Practical 9 – Desk Calculator

Integer calculator supporting `+`, `-`, `*`, `/`, `%`, `^`, parentheses, and unary minus. It rejects division/modulo by zero and negative exponents.

Build:
```sh
yacc -d calc.y
lex calc.l
gcc y.tab.c lex.yy.c -o practical9 -ll -lm
./practical9
```
