#include <stdio.h>
void func(char *str) {
	printf(str, 10, 34, str) ;
}
// A comment
int main() {
	// A cool comment
	char *str = "#include <stdio.h>%1$cvoid func(char *str) {%1$c	printf(str, 10, 34, str) ;%1$c}%1$c// A comment%1$cint main() {%1$c	// A cool comment%1$c	char *str = %2$c%3$s%2$c ;%1$c	func(str) ;%1$c}" ;
	func(str) ;
}