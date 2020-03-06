#include <stdio.h>

void main()
{
    int i;
    if (fork())
    {
        for (i = 0 ; i < 100000 ; i++)
        {
            printf("**        PARENT  %d\n", i);
        }
    }
    else {
        for (i = 0 ; i < 100000 ; i++)
        {
            printf("**        CHILD  %d\n", i);
        }
    }
}