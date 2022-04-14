#include <stdio.h>
#include <string.h>

long sum64(long t_a, long t_b);
long average_long(long *t_array, int t_len);
int average_int(int *t_array, int t_len);
char *to_lower(char *t_str);

char *to_lo_up( char *t_str, int t_lo_up );                     //task1
int palindrome( unsigned long t_num );                                   //taks2
void min_max( int *t_array, int t_len, int *t_min, int *t_max );  //task3
long sum_reg( long *t_array, int t_len );                        //task4



int main() {
//    printf("sum64 %ld\n", sum64(1000000000000000, 222333444555666777));
//    long l_array[10]={1,2,3,4,5,6,7,8,9,10};
//    printf("prumer: %ld\n", average_long(l_array, 10) );
//    int l_array_int[10]={-2000000000,-2000000000,-2000000000,-2000000000,-2000000000,-2000000000,-2000000000,-2000000000,-2000000000,-2000000000 };
//    printf("prumer int %d\n", average_int(l_array_int, 10));
//    char t_str[]= "NazDar ProgramaTchori 123(),.";
//    printf("to lower: %s\n", to_lower(t_str));
    char t_arr[] = "pokus VELKYch p1111smen.";
    to_lo_up(t_arr,0 );
    printf("task1 up: %s \n",t_arr);
    to_lo_up(t_arr,1 );
    printf("task1 lo: %s \n",t_arr);

    printf("task2 je: %d\n", palindrome(0xf000000f));
    printf("task2 neni: %d\n", palindrome(0xff000000));

    int min=0, max=0;
    int arr_int[10]={-1,0,50, 8, -10, 7, 1, 9000, -42, -2 };
    min_max(arr_int, 10, &min, &max);
    printf("task3: min: %d, max: %d\n", min, max );

    long t_arr2[10] = {150, 10, 50, 1, 71,2, 10, 110, 42, 11};
    printf("task4: %ld\n", sum_reg(t_arr2,sizeof(t_arr2)/8));


    return 0;
}
