#include<stdio.h>

extern long long int nge(long long int* arr,long long int* ans,long long int n);


int main()
{
	long long int m, n, quotient,remainder;
	printf("#########################################################\n");
	printf("Program to find the Nearest Taller Person: \n");
	printf("#########################################################\n");
	printf("Enter the Heights of Students: ");
	scanf("%lld", &n);
    long long int arr[n];
    for(int i=0;i<n;i++) scanf("%lld",&arr[i]);
    long long int ans[n];
    int check=nge(arr,ans,n);
    if(check==-1){
		printf("-1\n");
	}
	else{
		for(int i=0;i<n;i++){
			printf("%lld ",ans[i]);
		}
		printf("\n");
	}
}
