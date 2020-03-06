#include <stdio.h>
#include <unistd.h>


void main()
{
    static char *cmd[] = { "ps" , "ls", "date", "goof" };
    int i;

    printf("0=ps, 1=ls, 2=date 3=goof : ");
    scanf("%d", &i);

    int p = fork();
    int finished = 0;
    if (p) {
        //Parent
        while (!finished) {

        }
        printf("finished execution");
    }else {
        // Child
        execlp(cmd[i], cmd[i], NULL);
        finished = 1;
    }

    printf("command not found\n");
}