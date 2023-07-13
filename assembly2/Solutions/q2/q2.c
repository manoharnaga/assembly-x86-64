#include <stdio.h>


extern long long int binseq(long long int n,long long int change);

// long long int bin(int n,int change){
//     if(n==0) return 0;
//     if(n==1 && change==0) return 2;
//     if(n==1 && absi(change)==1) return 1;
//     if(n<absi(change)) return 0; 
//     return (2*(bin(n-1,change))+bin(n-1,change-1)+bin(n-1,change+1))%13;
// }

int main(){
    long long int n;
	printf("#########################################################\n");
	printf("Program to find the Count of All Binary Sequences of length 2*n: \n");
	printf("#########################################################\n");
	printf("Enter the Number n: ");
	scanf("%lld", &n);
    long long int ans = binseq(n,0);
    if(ans==-1){
        printf("-1\n");
    }
    else{
        printf("%lld\n",ans);
    }
    return 0;
}