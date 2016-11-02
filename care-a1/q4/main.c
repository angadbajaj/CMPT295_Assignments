
#include <stdio.h>

unsigned times(unsigned, unsigned);

void main () {
	unsigned a = 31;
	unsigned b = 4;
	printf("The product of %u and %u is %u.\n", a, b, times(a,b));
	return;
}
