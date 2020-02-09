#include <fcntl.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

void main() 
{
	int fd;
	printf("%d\n", errno);
	perror("foo");
	fd = open("foo", O_WRONLY | O_CREAT, 0644);
	if (fd < 0)
	{
		printf("error number %d\n", errno);
		perror("foo");
		exit(1);
	}
	write(fd, "hello world\n", 12);
	char buffer[50];
	char str[10] = "asdfghjklm";
	printf("%s\n", buffer);
	printf("%s\n", str);
	write(buffer, &str , sizeof (str));
	printf("%s\n", buffer);
	close(fd);
}
	
