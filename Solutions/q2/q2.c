#include<stdio.h>

extern long long int gcdval(long long int b,long long int a);

int main()
{
	long long int a, b, ans;
	printf("#########################################################\n");
	printf("Program to find the GCD of two numbers\n");
	printf("#########################################################\n");
	printf("Give two numbers as input: ");
	scanf("%lld %lld", &a, &b);
	ans = gcdval(b,a);
	printf("Answer: %lld\n", ans);
}
