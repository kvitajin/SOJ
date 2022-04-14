#include <stdio.h>
#include <string.h>
#include <stdarg.h>

long faktorial(long t_num);
int taskfff(int t_num,...);
long task2(int t_a, int t_b);
long task3(long t_num);


int suma(int t_num,...){
    va_list l_list;
    va_start(l_list, t_num);
    int l_suma=0;
    while (1){
        l_suma+=t_num;
        printf("%d\n", t_num);
        if (t_num==0){
            break;
        }
        t_num= va_arg(l_list, int);
    }
    return l_suma;

}
int ffaktorial(int n){
    if (n==0) return 1;
    return n * faktorial(n-1);
}



int main() {
//    printf("Suma: %d\n", suma(1,2,3,4,5,6,7,8,9,10, 0));
//    printf("faktorial: %ld\n", faktorial(20));
//    task1(1,2,-1);
    printf("task1: %d\n", taskfff(1,2,-1) );
    printf("task2: %ld\n", task2(2, 4) );
    return 0;
}
