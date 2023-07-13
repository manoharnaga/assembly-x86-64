#include<stdio.h>

extern long long int lpf(long long int n);

int main()
{
	long long int N,M;
	printf("#########################################################\n");
	printf("Program to find the LARGEST PRIME FACTOR\n");
	printf("#########################################################\n");
	printf("Give a number as input: ");
	scanf("%lld", &N);
	M = lpf(N);
	printf("%lld\n",M);
}
