#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <math.h>
#include <malloc.h>

#define  D2 16
#define Z2 (1<<D2)

#define D10 2
double Z10 = pow(10, D10);
#define M_PI 3.14159265358979323846



float fix2float(int t_fix){
    return ((float)t_fix)/Z2;
}
int float2fix (float t_fl){
    return (int)t_fl*Z2;
}
float fix2float10(int t_fix){
    return ((float)t_fix)/Z10;
}
int float2fix10 (float t_fl){
    return t_fl*Z10;
}



int mul_fix(int t_a, int t_b, int t_D);
int div_fix(int t_a, int t_b, int t_D);

int mul_fix10(int t_a, int t_b, int t_Z);
int div_fix10(int t_a, int t_b, int t_Z);



int odm(int t_fix){
    int result=0;
    long long divadlo=t_fix;               //int do zakulisi
    int *p_divadlo =(int*)&divadlo; //[0] zakulisi [1] scena
    for (int i = 0; i < 16; ++i) {
        result<<=1;
        divadlo<<=2; //dalsi dva na scenu
        int tmp= (result<<1) + 1;
//        printf("tmp %d, p_divadlo %d\n", tmp, p_divadlo[1]);
        if( p_divadlo[1]>=tmp){
            result |=1;
            p_divadlo[1]-=tmp;
        }
    }
//    if (t_rem) *t_rem=p_divadlo[1];
    return result;
}

int main() {

//    printf("fix: %d\n",float2fix(1));
//    printf("fix: %d\n",float2fix(0.5));
//    printf("fix: %d\n",float2fix(3.14));
//
//    printf("float: %f\n", fix2float(1));
//    printf("float: %f\n", fix2float(512));
//    printf("float: %f\n", fix2float(768));
//
//    int fix1= mul_fix(float2fix(2), float2fix(2), D2);
//    printf("mult %d, %f \n", fix1, fix2float(fix1));
//
//    int fix2= div_fix(float2fix(1234), float2fix(10), D2);
//    printf("div %d %f\n", fix2, fix2float(fix2));

//    printf("odm: %d\n", odm(100));
    int mul10= mul_fix10(float2fix10(5), float2fix10(3), Z10);
    printf("mul10: %f\n",fix2float10(mul10));
    int div10= div_fix10( float2fix10(10), float2fix10(3), Z10);
    printf("div10: %f\n", fix2float10(div10));
    int r=3;
    float Vf=3.0/4.0*M_PI* pow(r,3);
    float Sf=4*M_PI* pow(r, 2);

    int r3b= mul_fix(mul_fix(float2fix(r),float2fix(r), D2), float2fix(r), D2);
    float V2= mul_fix(
                mul_fix(
                  div_fix(float2fix(4), float2fix(3), D2),
                float2fix(M_PI), D2),
              r3b, D2);
    int r3d= mul_fix10(mul_fix10(float2fix10(r), float2fix10(r), Z10), float2fix10(r),Z10);
    float V10= mul_fix10(
                mul_fix10(
                    div_fix10(float2fix10(4), float2fix10(3), Z10),
                    float2fix10(M_PI), Z10),
                    r3d, Z10
            );


    printf("Vf: %f\n", Vf);
    printf("V2: %f\n", fix2float(V2));
    printf("V10: %f\n", fix2float10(V10));

    int r2b=mul_fix(float2fix(r),float2fix(r), D2);
    float S2= mul_fix(mul_fix(float2fix(4), float2fix(M_PI), D2), r2b, D2);
//    float S10= mul_fix10(mul_fix10(float2fix10(4)));
    printf("\n");
    printf("Sf: %f\n", Sf);
    printf("S2: %f\n", fix2float(S2));






    return 0;
}
