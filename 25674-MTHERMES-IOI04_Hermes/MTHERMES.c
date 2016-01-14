/*
In a modern city for Greek gods, the streets are geometrically arranged as a grid with
integer coordinates with streets parallel to the x and y axes. For each integer value Z,
there is a horizontal street at y=Z and a vertical street at x=Z. This way, integer
coordinate pairs represent the street junctions. During the hot days, the gods rest in
cafeterias at street junctions. Messenger Hermes is to send photon messages to gods
resting in the cafeterias by only moving along the city streets. Each message is for a
single god, and it does not matter if the other gods see the message.

The messages are to be sent in a given order, and Hermes is provided the coordinates of
the cafeterias in that order. Hermes starts from (0,0). To send a message to a cafeteria
at (Xi,Yi), Hermes only needs to visit some point on the same horizontal street (with
y-coordinate Yi) or on the same vertical street (with x-coordinate Xi). Having sent all
of the messages, Hermes stops.

You are to write a program that, given a sequence of cafeterias, finds the minimum total
distance Hermes needs to travel to send the messages.

INPUT

The first line contains one integer N: the number of messages to be sent. The following
N lines contain the coordinates of the N street junctions where the messages are to be
sent. These N lines are in the order in which the messages are to be sent. Each of these
N lines contains two integers: first the x-coordinate and then the y-coordinate of the
street junction.

OUTPUT

The file is to contain a single line containing one integer: the minimum total distance
Hermes needs to travel to send the messages.
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct S_NODO {
  int x;
  int y;
  int d;
} s_nodo;

typedef s_nodo* ptrnodo;

int main(void) {
  int N, nodo, nodoini, nodofin, nivel, destx, desty, padre, minimo;
  ptrnodo *nodos;
  
  scanf("%d\n", &N);    // mensajes a enviar ( = niveles del árbol binario)
  
  // -----------------------------------
  // Reservar memoria para árbol binario
  // -----------------------------------
  
  nodofin = (1 << (N+1));
  nodos = malloc(nodofin * sizeof(ptrnodo));
  if (nodos == NULL) {
    printf("ERROR: malloc()\n");
    exit(0);
  }
  
  // -------------------
  // Crear árbol binario
  // -------------------
  
  nodo = 0;
  nodos[nodo] = (ptrnodo) malloc(sizeof(s_nodo));
  nodos[nodo]->x = 0;
  nodos[nodo]->y = 0;
  nodos[nodo]->d = 0;
  
  for (nivel = 1; nivel <= N; nivel++) {
    scanf("%d %d\n", &destx, &desty);
    nodoini = (1 << nivel) - 1;
    nodofin = (1 << (nivel+1)) - 2;
    for (nodo = nodoini; nodo <= nodofin; nodo += 2) {
      padre = nodo / 2;   // nodo padre
      nodos[nodo] = (ptrnodo) malloc(sizeof(s_nodo));
      nodos[nodo]->x = destx;
      nodos[nodo]->y = nodos[padre]->y;
      nodos[nodo]->d = nodos[padre]->d + abs(destx - nodos[padre]->x);
      nodos[nodo+1] = (ptrnodo) malloc(sizeof(s_nodo));
      nodos[nodo+1]->x = nodos[padre]->x;
      nodos[nodo+1]->y = desty;
      nodos[nodo+1]->d = nodos[padre]->d + abs(desty - nodos[padre]->y);
    }
  }
  
  // ---------------------------------------------
  // Comprobar mínima distancia en el último nivel
  // ---------------------------------------------

  nodoini = (1 << N) - 1;
  nodofin = (1 << (N+1)) - 2;
  minimo = nodos[nodoini]->d;
  for (nodo = nodoini; nodo <= nodofin; nodo++) {
    if (nodos[nodo]->d < minimo) {
      minimo = nodos[nodo]->d;
    }
  }
  printf("%d\n", minimo);
  
  return 0;
}
