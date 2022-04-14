#include <stdio.h>
#include <string.h>
int mystrlen(char* t_str);
void mystrcpy(char* t_dest, char* t_src);
char* to_lower(char *t_str);
int soucet_char(char* t_array, int t_N);
int task2(char *t_str);
int task3(char* t_str1, char* t_str2);



int main() {
//    printf("mystrlen: %d\n", mystrlen("tri"));
    char l_cil[100];
    mystrcpy(l_cil, "Nazdar svete. Tohle bude bolet");
    mystrcpy(l_cil+1, l_cil);
    printf("strcmp: %s\n", l_cil);
//    printf("to_lower %s\n", to_lower(l_cil));
    printf("Task2: %d\n", task2("     5mezer"));
    printf("task3:%d\n", task3("asdfa", "asdfa"));
    return 0;
}
