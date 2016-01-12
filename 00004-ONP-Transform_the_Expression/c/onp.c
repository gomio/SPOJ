#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int N, n;
int level;
char expr[1024];
char result[1024];
char *res;
char *p;
char op[1024];

int main(void) {
  gets(expr);
  N = atoi(expr);
  
  for (n = 0; n < N; n++) {
    gets(expr);
    res = result;
    level = 0;
    p = expr;
    while (1) {
      if (*p == '(') {
        level++;
      }
      else if (isalpha(*p)) {
        *res++ = *p;
      }
      else if ((*p=='+')||(*p=='-')||(*p=='*')||(*p=='/')||(*p=='^')) {
        op[level] = *p;
      }
      else if (*p == ')') {
        *res++ = op[level];
        level--;
      }
      else if (*p == '\0') {
        break;
      }
      p++;
    }
    *res = '\0';
    puts(result);
  }
  return(0);  
}
