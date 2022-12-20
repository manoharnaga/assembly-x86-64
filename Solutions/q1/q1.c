#include<stdio.h>

extern long long int quot(long long int m,long long int n);
extern long long int rem(long long int m,long long int n);


int main()
{
	long long int m, n, quotient,remainder;
	printf("#########################################################\n");
	printf("Program to find the Quotient && Remainder of M,N\n");
	printf("#########################################################\n");
	printf("Give two numbers as input: ");
	scanf("%lld %lld", &m, &n);
	quotient = quot(m,n);
    remainder = rem(m,n);
	printf("Answer: %lld %lld\n", quotient,remainder);
}
