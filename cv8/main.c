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
int main() {
    int aN[N]={0x57, 0x60, 0x70, 0x80, 0xA0, 0xB0, 0xC0, 0xFFFFFFFF};
    int bN[N]={0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x80, 0xA0, 0xB0, 0xC0, 0xD0};
    int rem=div_intN_int32(aN, N, 16);
    for (int i = 0; i < N; ++i) {
        printf("%08X ", aN[N-i-1]);
    }
    printf("\n rem: %d\n",rem);
    add_intN_int32(bN, N, 1);
    for (int i = 0; i < N; ++i) {
        printf("%08X ", bN[N-i-1]);
    }
    printf("\n");
//    mul_intN_int32(aN, N, 16);
//    for (int i = 0; i < N; ++i) {
//        printf("%08X ", aN[N-i-1]);
//    }
//    printf("\n");

    int over = mul_intN_int32( aN, N, 16 );
    over = mul_intN_int32( aN, N, 16 );

    for ( int i = 0; i < N; i++ )
        printf( "%08X ", aN[ N - i - 1 ] );
    printf( "\nover: %d\n", over );

    return 0;
}
