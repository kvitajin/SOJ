#include <stdio.h>
//void set_x();
//int g_int_x;
//char g_char_z=-1;
//int g_int_arr[3];
//char g_char_str[]="puma je kocka";
//void move_z2x();
//void set_arr();
//void set_puma();
//------------------------------------------
int g_int_X, g_int_Y;
void task1();
char g_char_arr[ 5 ] = "....";
void task2();
void task3();
char g_char_num[ 2 ] = { -100, 100 };
void task4();
void task5();




int main() {
//    set_x();
//    printf("x=%d\n", g_int_x);
//
//    move_z2x();
//    printf("x=%d\n", g_int_x);
//
//    set_arr();
//    printf("x1=%d, x2=%d, x3=%d\n", g_int_arr[0], g_int_arr[1], g_int_arr[2]);
//
//    set_puma();
//    printf("%s\n", g_char_str);

    task1();
    printf("Task1: X=%d, Y= 0x%x\n", g_int_X, g_int_Y);

    task2();
    printf("Task2: %s\n", g_char_arr);

    task3();
    printf("Task3: X=0x%x, Y= %d\n", g_int_X, g_int_Y);

    task4();
    printf("Task4: X=%d, Y= %d\n", g_int_X, g_int_Y);

    task5();
    printf("Task5: %08x\n", g_int_X);
    return 0;
}
