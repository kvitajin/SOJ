#include <stdio.h>
int int_mul(int t_a, int t_b);
long long int_mul64(int t_a, int t_b);
int int_div(int t_a, int t_b, int* t_reminder);
int int_div64(long long t_a, int t_b);
long long int_add64(long long t_a, long long t_b);
long long ll_shr(long long t_a, int t_kolik);
int task1(int* pole, int l_n);
long long task2(long long t_a, long long t_b);
long long task3(long long t_a, int t_kolik);
long long task4_l(long long t_a, int t_kolik);
long long task4_r(long long t_a, int t_kolik);




int main() {
//    printf("Mul %d \n", int_mul(1234, 1000000));
//    printf("Mul64 %lld \n", int_mul64(1234, 1000000000));
////    printf("Div %d \n", int_div(123456789, 10000));
//    int l_rem;
//   // printf("Div %d, zbytek: %d \n", int_div(10, 3,l_rem), l_rem);
//   // printf("Div %d,  \n", int_div64(123456789123456789LL,100000 ));
//    printf("add64 %llX  \n", int_add64(0xFFFFFFFFFFFF,1 ));
//    printf("add64 %llX  \n", int_add64(0xFFFFFFFFFFFF,0xFFFFFFFFFFFF ));
//    printf("ll_shr 0x%llX  \n", ll_shr(0x12345678912345,28 ));
    int task1_arr[5]={1,2,4,7,21};
    int task11_arr[10]={1,2,3,4,5, 6, 7, 8, 9, 10};
    printf("task1:avg:%d\n", task1(task11_arr, 10));
    printf("task2:sub:0x%llx\n", task2(0x1000000000000, 1));
    printf("task3:0x%llx\n", task3(0x12345678912345, 28));
    printf("task4r:0x%llx\n", task4_r(0x12345678912345, 28));
    printf("task4l:0x%llx\n", task4_l(0x12345678912345, 28));




    return 0;
}
