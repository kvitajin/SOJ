#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <math.h>
#include <malloc.h>
float f2f (float t_a);
double d2d (double t_a);
double f2d(float t_a);
float d2f(double t_a);

float fadd(float t_a, float t_b);
double aver(double* t_array, int t_len);

int task2(double t_a, double t_b, double t_c);
void minmax(double *t_arr, int t_len, double* minmaxret);
void rozloz(float *t_a, int *pole);

int main() {
//    printf("f2f: %f\n", f2f(123.456));
//    printf("d2d: %f\n", d2d(654.321));
//    printf("f2d: %f\n", f2d(654.321));
//    printf("d2f: %f\n", d2f(654.321));
//    printf("fadd: %f\n", fadd(654.321, 123.456));
    double t_arry[10]={1,2,3,4,5,6,7,8,9,10};
//    printf("aver: %f\n", aver(t_arry, 10));
    printf("task2 yes: %d\n", task2(1,2,3));
    printf("task2 no: %d\n", task2(5,6,13));
    printf("task2 yes: %d\n", task2(5,4,3));
    double minmaxarr[2];
    minmax(t_arry, 10, minmaxarr);
    printf("task3: min: %f, max: %f\n",minmaxarr[0], minmaxarr[1] );
    return 0;
}
