#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


int N, i, c1, c2, csum, carry, fin1, fin2;
char lin[100];
char result[100];
char *p1, *p2, *res;

int main(void) {
  gets(lin);
  N = atoi(lin);
  
  for (i = 0; i < N; i++) {
    res = result;
    gets(lin);
    // buscar comienzo de primer nmero
    p1 = lin;
    while (isspace(*p1)) p1++;
    // buscar comienzo de segundo nmero
    p2 = p1;
    while (isdigit(*p2)) p2++;
    while (isspace(*p2)) p2++;
    fin1 = fin2 = 0;
    carry = 0;
    while (1) {
      c1 = *p1;
      if (!isdigit(c1)) {
        c1 = '0';
        fin1 = 1;
        p1--;
      }
      c2 = *p2;
      if (!isdigit(c2)) {
        c2 = '0';
        fin2 = 1;
        p2--;
      }
      if (fin1 && fin2) {
        if (carry) *res++ = '1';
        *res = '\0';
        break;
      }
      c1 -= '0';
      c2 -= '0';
      csum = c1 + c2 + carry;
      if (csum > 9) {
        csum -= 10;
        carry = 1;
      } else {
        carry = 0;
      }
      *res++ = csum + '0';
      p1++;
      p2++;
    }
    while (*--res == '0') *res = '\0';    // limpiar ceros finales
    res = result;
    while (*res == '0') res++;            // limpiar ceros iniciales
    puts(res);
  }
  return(0);
}
