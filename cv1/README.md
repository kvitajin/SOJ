

1. Otočte všem číslům v poli znaménko, bez použití NEG.

2. Upravte všechna čísla v poli na lichá.

3. Spočítejte, kolik je v poli sudých čísel. ( x & 1 )

4. Nezkušený programátor si zakódoval své heslo pomocí XOR se samými jedničkami. Jaké má heslo? (0x8f9eac8c88cf8d9b)

5. Převeďte číslo na hex string. `oid nahex( int t_num, char *t_str, char *t_prevod )`, kde `t_prevod` bude `"0123456789ABCDEF"`.

```c
for ( int i = 0; i < 8; i++ )
t_str[ 7 - i ] =  t_prevod[ t_num & 0xF ]
t_num >>= 4       // shr reg, 4
```

