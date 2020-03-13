#include<stdio.h>
#include<string.h>
#include<pthread.h>
#include<stdlib.h>
#include<unistd.h>

pthread_t tid[2];

void* doSomeThing(void *arg)
{
    unsigned long i = 0;
    pthread_t id = pthread_self();

    if(pthread_equal(id,tid[0]))
    {
        printf("\n First thread processing\n");
		int j = 0;
		for (j ; j < 600 ; j++)
		{
				printf("thread 1: %d\n", j);
		}
    }
    else
    {
        printf("\n Second thread processing\n");
		int k = 0;
		for (k ; k < 600 ; k++) {
				printf("thread 2: %d\n", k);
		}
    }

    return NULL;
}

int main(void)
{
    int i = 0;
    int err;

    while(i < 2)
    {
        err = pthread_create(&(tid[i]), NULL, &doSomeThing, NULL);
        if (err != 0)
            printf("\ncan't create thread :[%s]", strerror(err));
        else
            printf("\n Thread created successfully\n");

        i++;
    }


	int c = 0;
	for (c ; c < 600 ; c++)
	{
			printf("original thread: %d\n", c);
	}

    sleep(5);
    return 0;
}
