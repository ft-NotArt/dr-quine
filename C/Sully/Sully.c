int i = 5 ;
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#define STR "int i = %4$d ;%1$c#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c#include <string.h>%1$c#include <stdlib.h>%1$c#define STR %2$c%3$s%2$c%1$cint main() {%1$c	if ((strcmp(__FILE_NAME__, %2$cSully.c%2$c) ? --i : i) < 0) return 0;%1$c	char file_name[25];%1$c	bzero(file_name, 25);%1$c	sprintf(file_name, %2$cSully_%%d.c%2$c, i);%1$c	int fd = open(file_name, O_CREAT | O_WRONLY, 0644);%1$c	if(fd==-1) return 1;%1$c	dprintf(fd, STR, 10, 34, STR, i);%1$c	close(fd);%1$c	char exec[250];%1$c	bzero(exec, 250);%1$c	sprintf(exec, %2$cclang -Wall -Wextra -Werror Sully_%%1$d.c -o Sully_%%1$d ; ./Sully_%%1$d%2$c, i);%1$c	system(exec);%1$c}"
int main() {
	if ((strcmp(__FILE_NAME__, "Sully.c") ? --i : i) < 0) return 0;
	char file_name[25];
	bzero(file_name, 25);
	sprintf(file_name, "Sully_%d.c", i);
	int fd = open(file_name, O_CREAT | O_WRONLY, 0644);
	if(fd==-1) return 1;
	dprintf(fd, STR, 10, 34, STR, i);
	close(fd);
	char exec[250];
	bzero(exec, 250);
	sprintf(exec, "clang -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d ; ./Sully_%1$d", i);
	system(exec);
}