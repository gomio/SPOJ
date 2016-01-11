#include <stdio.h>
#include <stdlib.h>

typedef struct Clase {
  int n;
  int *notas;
} Clase;

int main(void) {
  int i, j, nclases, nalumnos, nota;
  int T, A, B, D, Dmin;
  Clase *clases;
  
  while (1) {   // un ciclo por cada caso
    scanf("%d", &nclases);
    if (nclases == -1) break;
    
    // Almacenar datos del caso
    clases = malloc(sizeof(Clase) * nclases);
    for (i = 0; i < nclases; i++) {
      scanf("%d", &nalumnos);
      clases[i].n = nalumnos;
      clases[i].notas = malloc(sizeof(int) * nalumnos);
      for (j = 0; j < nalumnos; j++) {
        scanf("%d", &nota);
        clases[i].notas[j] = nota;
      }
    }
    
    // Análisis del caso: busqueda de T que minimiza la suma de las
    // diferencias entre nº de alumnos de tipo A y B en cada clase.
    Dmin = 0;
    for (T = 0; T <= 1000; T++) {
      D = 0;
      for (i = 0; i < nclases; i++) {
        A = 0; B = 0;
        for (j = 0; j < clases[i].n; j++) {
          if (clases[i].notas[j] >= T)
            A++;
          else
            B++;
        }
        D += abs(A-B);
      }
      if ((D < Dmin) || (T == 0)) Dmin = D;
    }
    printf("%d\n", Dmin);
    
    // Liberar memoria del caso
    for (i = 0; i < nclases; i++) free(clases[i].notas);
    free (clases);
  }
  return 0;
}
