#include <stdio.h>

void main()
{
    int x = 10;
    int a = fork();
    if (a) {
        printf("I am the parent\n");
        printf("%d\n", x);
        printf("%d\n", a);
    }else {
        printf("I am the child\n");
        printf("%d\n", x);
        printf("%d\n", a);
    }
    while(1) {

    }
}