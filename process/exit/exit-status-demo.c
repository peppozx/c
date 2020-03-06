#include <stdio.h>
#include <stdlib.h>


int main()
{
    int status;
    if (fork())
    {
        /* Parent */
        printf("parent waiting for child ...\n");
        wait(&status);
        if (WIFEXITED(status))
        {
            printf("child ended normally, exit status = %d\n", WEXITSTATUS(status));
        }
        if (WIFSIGNALED(status))
        {
            printf("child terminated by signal %d\n", WTERMSIG(status));
        }
    } else
    {
        /* Child */
        printf("child running -- PID is %d\n", getpid());
        int status2;
        if (fork())
            {
                /* Parent */
                printf("parent (child) waiting for child child ...\n");
                wait(&status2);
                if (WIFEXITED(status2))
                {
                    printf("child child ended normally, exit status = %d\n", WEXITSTATUS(status2));
                }
                if (WIFSIGNALED(status2))
                {
                    printf("child terminated by signal %d\n", WTERMSIG(status2));
                }
            } else
            {
                /* Child */
                printf("child child running -- PID is %d\n", getpid());
                sleep(10);
                exit(3);
            }
        sleep(5);
        exit(3);
    }
}