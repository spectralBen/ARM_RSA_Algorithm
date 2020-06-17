//Resources for testing small bits of code
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>

void order_of_operations(int x, int* y, int* z){

	// Both of these operation orders seem equivalent
	*y = (*y * (*y)) % x;
	*z = (*z) * (*z) % x;
}

int main(){

/*
	int x = 7;
	int y = 47;
	int z = 47;	
	order_of_operations(x,&y,&z);
	printf("x is:\t%d\n", x);
	printf("y is:\t%d\n", y);
	printf("z is:\t%d\n", z);
*/
}
