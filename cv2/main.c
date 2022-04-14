#include <stdio.h>
#include <string.h>

int search_max(int *t_arr, int len);
void str_upper(char* t_str);
int num_ones (int l_num);
unsigned int bit_mirror(unsigned int t_num);
char check( char *t_str );
int set_bits( int *t_pole, int t_len );
int task2 (int *t_numbers, int t_len);


int main() {
//    int l_pole[10]= {2,5,20,4,799,99,6,6,3,56};
//    printf("max je: %d\n", search_max(l_pole, 10));
//    char l_ret[]="Dnes je ctvrtek 00234";
//    str_upper(l_ret);
//    printf(" %s\n", l_ret);
//
//    printf("num oned %d\n ", num_ones(0xF0F0103));
    unsigned int t_num =0xFFF00000;
    printf("task1: %08X\n", bit_mirror(t_num));

    int t_numbers[10]={-2,-5, -7,5,7,6,-1,-70,80, -10};
    printf("task2: %d\n", task2(t_numbers, 10));
    int t_pole[]= {0,3};
    printf("task4:%d\n", set_bits( t_pole, 2));

    return 0;
}
