#include <stdio.h>

int add(int a, float b){
	return (a+b);
}
int main(){
	int x = 10*3;
	float y = x-3%2;
	int c = add(x,y);
	printf("%d",c);
}
