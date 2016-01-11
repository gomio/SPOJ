#include <stdio.h>
#include <stdlib.h>

int main(void) {
  int n, i, result;
  
  while (1) {         // un ciclo para cada caso
    scanf("%d", &n);
    if (n == 0) break;
    result = 5;
    for (i = 0; i < n; i++) result += (3*i);
    result += (4*(i-1));
    printf("%d\n", result);
  }
  return 0;
}
