# Practical 7 – Check Whether a Line Ends With COM

Reports whether each input line ends with the uppercase suffix `COM`.

Build:
```sh
flex end_with_com.l
gcc lex.yy.c -o practical7 -lfl
./practical7
```
