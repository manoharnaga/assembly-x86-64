#include<stdio.h>

extern long long int sos(long long int n);

int main()
{
	long long int N,M;
	printf("#########################################################\n");
	printf("Program to find the SUM OF SQUARES TILL N\n");
	printf("#########################################################\n");
	printf("Give a number as input: ");
	scanf("%lld", &N);
	M = sos(N);
	printf("%lld\n",M);
}
