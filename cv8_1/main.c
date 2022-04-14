#include <stdio.h>
#include <string.h>
#include <stdarg.h>
//t_intN-t_intN/t_delitel, return zbytek
int div_intN_int32(int *t_intN, int t_len, int t_delitel);
//int N+=t_add, return CF
int add_intN_int32(int *t_intN, int t_len, int t_add);
//int N*=t_cinitel
int mul_intN_int32(int *t_intN, int t_len, int t_cinitel);
#define N 8


void intN_to_str( int *n, int N_INT, char *s ){
    int pos=N_INT;
    for (int i = 0; i < N_INT; ++i) {
//        s[i]= div_intN_int32(&n[i], 1, 32)+'0';
//        --pos;
        s[i]=n[N_INT-i-1]+'0';
    }
}
//d[0]=N%Z+'0'
//N=N/Z

void str_to_intN( char *s,int N_INT,int *n ){
    for (int i = 0; i <N_INT; ++i) {
        n[i]+=s[N_INT-i-1]-'0';
    }
}
//N+=(s[i]-'0')+Z
//N=N*Z

#define N_INT   2
#define N_CHAR  ( N_INT * 32 * 10 / 3 + 2 )


int main() {
    long long x = 8983082438909876534LL;
    long long y = 0;
    char cislo[ N_CHAR ];

    int aN[N]={0x57, 0x60, 0x70, 0x80, 0xA0, 0xB0, 0xC0, 0xFFFFFFFF};
    int bN[N]={0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x80, 0xA0, 0xB0, 0xC0, 0xD0};
    int rem=div_intN_int32(aN, N, 16);
    for (int i = 0; i < N; ++i) {
        printf("%08X ", aN[N-i-1]);
    }
    printf("\n rem: %d\n",rem);
///-----------------------------------------------------------//
    add_intN_int32(bN, N, 1);
    for (int i = 0; i < N; ++i) {
        printf("%08X ", bN[N-i-1]);
    }
    printf("\n");
///-----------------------------------------------------------//

    mul_intN_int32(aN, N, 16);
    for (int i = 0; i < N; ++i) {
        printf("%08X ", aN[N-i-1]);
    }
    printf("\n");
///-----------------------------------------------------------//

//    int over = mul_intN_int32( aN, N, 16 );
//    over = mul_intN_int32( aN, N, 16 );
//
//    for ( int i = 0; i < N; i++ )
//        printf( "%08X ", aN[ N - i - 1 ] );
//    printf( "\nover: %d\n", over );

//    intN_to_str( ( int * ) &x, N_INT, cislo );
//    printf( "Number 'x' converted into string: '%s'\n\n", cislo );
//    char stri[100]="HELP";
//    int inti[100];
//    str_to_intN(stri, 100, inti);
//    printf("string to int: ");
//    for (int i = 8; i >-1 ; --i) {
//        printf("%X", inti[i]);
//    }
//    printf("\n");
//
//
//    int x2[4]={0x48, 0x45, 0x4C, 0x50};
//    intN_to_str(inti, 100, stri);
//    printf("intN_to_str: %s\n", stri);
    return 0;
}
