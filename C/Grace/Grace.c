#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
// Comment
#define STR "#include <sys/stat.h>%1$c#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c// Comment%1$c#define STR %2$c%3$s%2$c%1$c#define KID int fd = open(%2$cGrace_kid.c%2$c, O_CREAT | O_WRONLY, 0644);if(fd==-1)return 1;dprintf(fd, STR, 10, 34, STR);close(fd);%1$c#define MAIN int main(){KID}%1$cMAIN"
#define KID int fd = open("Grace_kid.c", O_CREAT | O_WRONLY, 0644);if(fd==-1)return 1;dprintf(fd, STR, 10, 34, STR);close(fd);
#define MAIN int main(){KID}
MAIN