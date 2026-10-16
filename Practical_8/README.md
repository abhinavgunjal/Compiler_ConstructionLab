# Practical 8 – Postfix Expression Evaluation

Evaluates integer postfix expressions using `+` and `*`. Example input: `2 3 + 4 *`.

Build:
```sh
yacc -d postfix.y
lex postfix.l
gcc y.tab.c lex.yy.c -o practical8 -ll
./practical8
```
