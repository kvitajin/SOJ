#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <math.h>
#include <malloc.h>

//#define N 8
int mul_intN_int32(int *t_intN, int t_len, int t_cinitel);
int div_intN_int32(int *t_intN, int t_len, int t_delitel);
int add_intN_int32(int *t_intN, int t_len, int t_add);
long mul(int t_a, int t_b){
    long result=0;
    long l_tmp_a=t_a;
    for (int i = 0; i < 32; ++i) {
        if(t_b & 1){
            result+=l_tmp_a;
        }
        l_tmp_a<<=1;
        t_b>>=1;
    }
    return result;

}
int ddiv (int t_a, int t_b){
    int result=0;
    long divadlo=t_a;               //t_a do zakulisi
    int *p_divadlo =(int*)&divadlo; //[0] zakulisi [1] scena
    for (int i = 0; i < 32; ++i) {
        result<<=1;
        divadlo<<=1; //prvni bit na scenu
        if( p_divadlo[1]>=t_b){
            result |=1;
            p_divadlo[1]-=t_b;
        }
    }
//    if (t_rem) *t_rem=p_divadlo[1];
    return result;
}
//t_intN <<=1;
int shl_intN(int *t_intN, int t_len );
int shr_intN(int *t_intN, int t_len );
int add_intN_intN(int *t_intNA,int *t_intNB,int t_len);
int sub_intN_intN(int *t_intNA,int *t_intNB,int t_len);


//https://www.wolframalpha.com/input?i=sum%28log10%28x%29%2C+%7Bx%2C1%2C3333%7D%29
long len_log(int num){
    double long result=0;
    for (int i = 1; i <= num; ++i) {
        result+=log10(i);
    }
    result*= log2(10);
    return (long)(result/32+1);
}
void task1(int num, int* result);

int is_zero( int *t_n, int t_N ){
    int i = 0;
    while ( i < t_N ) {
        if ( t_n[ i++ ] ) {
            return 0;
        }
    }
    return 1;
}
void intN_to_str(int* cislo, char* str, int N){
    int delka = 0;
    char* numStr = str;

    while (!is_zero(cislo, N)){
        *numStr++ = div_intN_int32(cislo, 10, N) + '0';
            delka++;
    };

    *numStr = '\0';

    for (int i = 0; i < delka / 2; i++){
        char tmp = str[i];
        str[i] = str[delka - 1 - i];
        str[delka - 1 - i] = tmp;
    }
}

void str_to_intN(char* str, int* cislo, int N){
    while (*str){
        mul_intN_int32(cislo, 10, N);
        add_intN_int32(cislo, *str - '0', N);
        ++str;
    }
}

int main() {
//    int bN[ N ] = { 0xFFFFFFFF, 0xFFFEFFFF, 0xFFFFFFFF, 0xA0, 0xB0, 0xC0, 0xD0 };
//    int cN[ N ] = {0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0,0,0,0};
//    int dN[ N ] = { 1,0,0,0,1,2,3,4};
//    int l_rem;
//    printf("mul: %ld\n", mul(1000000, 1000000));
//    printf("div: %d\n", ddiv(123456789, 100));
//    shl_intN(bN, N);
//    for (int i = 0; i < bN[N-i-1]; ++i) {
//        printf("%08X", bN[N-i-1]);
//    }
//    printf("\n");
//    shr_intN(bN, N);
//    for (int i = 0; i < bN[N-i-1]; ++i) {
//        printf("%08X", bN[N-i-1]);
//    }
//    printf("\n");
//    add_intN_intN(cN, dN,N);
//    for (int i = 0; i < bN[N-i-1]; ++i) {
//        printf("%08X", cN[N-i-1]);
//    }
//    printf("\n");
//    sub_intN_intN(cN, dN,N);
//    for (int i = 0; i < bN[N-i-1]; ++i) {
//        printf("%08X", cN[N-i-1]);
//    }
//    printf("\n");
    int num=3333;
    long len=len_log(num);
//    printf("%ld\n", len_log(3333));
    int *ptr;
    ptr=(int*)malloc(len*sizeof(int));
    char *str=(char*)malloc(len*sizeof(char));
    memset(ptr, 1, len);
//    ptr[0]=1;

    for (int i = 1; i <= num; ++i) {
        mul_intN_int32(ptr, (int)len, i);
    }
//    for (int i = 0; i < len; ++i) {
//        printf("%08d", ptr[i]);
//    }
    printf("tu\n");

    intN_to_str(ptr, str, (int)len*8 );
    printf("%s", str);
    free(str);
    free(ptr);

    return 0;
}
