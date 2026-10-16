# Practical 12 – Intermediate Code and Declaration Parsing

This folder contains two independent Flex/Yacc programs.

- `tac.l` + `tac.y`: generates three-address code for arithmetic expressions.
- `p_12/p_12.l` + `p_12/p_12.y`: validates simple comma-separated variable declarations.

Build the TAC program:
```sh
yacc -d tac.y
lex tac.l
gcc y.tab.c lex.yy.c -o tac -ll
./tac
```

Build the declaration parser:
```sh
cd p_12
yacc -d p_12.y
lex p_12.l
gcc y.tab.c lex.yy.c -o declarations -ll
./declarations
```
