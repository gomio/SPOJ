#include <stdio.h>
#include <stdlib.h>

char F100[101][160];  // tabla para los 100 primeros factoriales

void rellenar_tabla(void);

int main() {
  int N, n, item;
  char lin[200];
  
  rellenar_tabla();
  
  gets(lin);
  N = atoi(lin);
  for (n = 1; n <= N; n++) {
    gets(lin);
    item = atoi(lin);
    puts(F100[item]);
  }
  return(0);
}

void rellenar_tabla() {
  int cifras[160];          // las cifras de un factorial
  int carry, d;             // auxiliares en la multiplicaci�n
  int ultimo, i;            // �ndices a los d�gitos del factorial
  int n;
  char digitos[10] = {'0','1','2','3','4','5','6','7','8','9'};
  
  cifras[0] = 1;            // el n�mero empieza con 1
  ultimo = 0;               // el �ltimo d�gito del n�mero
  
  // bucle de c�lculo de 1!, 2!, 3!, 4!, ... , 100!
  for (n = 1; n <= 100; n++) {
    carry = 0;                          // empezar a multiplicar por n
    for (i = 0; i <= ultimo; i++) {     // recorrer cada d�gito
      d = cifras[i] * n + carry;        // la multiplicaci�n cl�sica
      cifras[i] = d % 10;               // el d�gito de menor orden
      carry = d / 10;                   // acarreo al siguiente d�gito
    }
    while (carry > 0) {                 // almacenar acarreo en el n�mero
      if (ultimo >= 160) {
        puts("DESBORDAMIENTO\n");
        exit(0);
      }
      ultimo++;                         // un d�gito m�s
      cifras[ultimo] = carry % 10;      // colocado
      carry = carry / 10;               // acarreo reducido
    }
    F100[n][ultimo+1] = '\0';
    for (i = 0; i <= ultimo; i++) {
      F100[n][ultimo-i] = digitos[cifras[i]];
    }
  }
}
