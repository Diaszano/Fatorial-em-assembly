# Fatorial em ASSEMBLY
## O objetivo era reescrever o seguinte código C em MIPS Assembly:
### 
~~~c
#include <stdio.h>
#include <stdlib.h>

int fatorial(int n);

int main(int argc, char const *argv[]){
    int n = 0;
    printf("Digite o valor do fatorial = ");
    scanf("%i",&n);
    n = fatorial(n);
    printf("O fatorial eh = %i\n",n);
    return 0;
}

int fatorial(int n){
    if(n == 0){
        n += 1;
    }else if(n == 1){
        return n;
    }
    return n * fatorial(n-1);
}
~~~