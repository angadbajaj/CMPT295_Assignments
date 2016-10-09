
#include <stdio.h>

int mystery(char *, int);

char *str = "Good mood food.";

void main () {
	int n = 0;
	for (n = 0; n < 16; n++)
	{
		printf("for n = %d The return value was:  %d.\n", n, mystery(str,n));
	}
	return;
}
