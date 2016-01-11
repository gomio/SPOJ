#include <stdio.h>
#include <stdlib.h>

int resolver(int n);

int main(void) {
  int n;
  char lin[255];
  
  while (1) {
    scanf("%s\n", lin);
    n = atoi(lin);
    if (n == 0) break;
    
    printf("%d\n", resolver(n));
  }
  exit(0);
}

int resolver(int n) {
  int tam, total, cpl;
  
  total = 0;
  for (tam = 1; tam <= n; tam++) {
    cpl = n - tam + 1;
    total += (cpl * cpl);
  }
  return total;
}
