#include <fcntl.h>
#include <stdio.h>

void main() 
{
	int fd;
	fd = open("foo", O_WRONLY | O_CREAT, 0644);
	printf("%d\n", fd);
	printf("%p\n", &fd);
	write(fd, "hello world\n", 11);
	char buffer[5];
	read(fd, buffer, 11);
	close(fd);
}
