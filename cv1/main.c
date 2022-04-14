#include <stdio.h>
#include <string.h>

int sum (int a, int b);
int sum_pole(int *t_pole, int t_N);
int mystrlen(const char *t_str);
int* task1(int *t_pole, int t_N);
int* task2(int *t_pole, int t_N);
int  task3(int *t_pole, int t_N);
int*  task4(int* passwd, int t_N);


int main() {
//    printf("soucet je %d\n", sum(100, 30));
//    int l_pole[10]={1,2,3,4,5,6,7,8,9,10};
//    printf("soucet je %d\n", sum_pole(l_pole, 10));
//    printf("delka; %d\n", mystrlen("nazdar programatori"));
//    printf("delka; %d\n", strlen("nazdar programatori"));
    int task1_arr[5]={-1,5,-6,7,20};
    task1(task1_arr, 5);
    printf("task1: ");
    for (int i = 0; i < 5; ++i) {
        printf("%d, ", task1_arr[i]);
    }
    printf("\n");
    int task2_arr[5]={-1,5,-6,7,20};
    task2(task2_arr, 5);
    printf("task2: ");
    for (int i = 0; i < 5; ++i) {
        printf("%d, ", task2_arr[i]);
    }
    printf("\n");
    int task3_arr[5]={-1,2,4,7,21};
    int passwd[4]={0x8f9eac8, 0xc88cf8d9b};
    printf("task3: pocet sudych:%d\n", task3(task3_arr, 5));
    printf("task4: heslo:%s\n", task4(passwd, 2));





    return 0;
}
//10 -10-10
//-10 -(-10)-(-10)