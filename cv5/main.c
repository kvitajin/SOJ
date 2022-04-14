#include <stdio.h>
#include <string.h>

int search_max(int *t_arr, int len);
void print_bin(int t_num);
char* task1(char* t_str);
int task4(char *t_arr, int len);





int main() {
    int l_pole[10]= {2,5,20,4,799,99,6,6,3,56};
    char l_pole2[10]="1234567899";
    char* t_str= "zdraVim v Plne Zoufalosti";
//    printf("max je: %d\n", search_max(l_pole, 10));
//    print_bin(0xf001800f);
//    printf("Task1:  %s", task1(t_str));

    printf("Task4: %d", task4(l_pole2, 10));
    return 0;
}
