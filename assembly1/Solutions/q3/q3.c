#include<stdio.h>

extern long long int is_prime(long long int x);

int main()
{
	long long int x,ans;
	printf("#########################################################\n");
	printf("Program to find the Whether the Given number is Prime/NOT Prime\n");
	printf("#########################################################\n");
	printf("Give a number as input: ");
	scanf("%lld", &x);
	ans = is_prime(x);
	if(ans==1){
		printf("TRUE\n");
	}
	else{
		printf("FALSE\n");
	}
}
