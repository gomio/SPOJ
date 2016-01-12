// Problem code: TEST

#include <stdio.h>
#include <stdlib.h>

int main(void) {
  char l[100];
  int n;
  
  while(1) {
    gets(l);
    n = atoi(l);
    if (n == 42) break;
    puts(l);
  }
  return 0;
}
