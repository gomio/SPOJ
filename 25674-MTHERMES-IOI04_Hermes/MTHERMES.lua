--[[
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
]]

-- GLOBALES -----------------------------------------------------------------------------
N = 0
lin = ""
destx = 0; desty = 0
nodos = {}              -- lista de todos los nodos del árbol binario           
nodo = 0
padre = 0
minimo = 0
-- FIN GLOBALES -------------------------------------------------------------------------

lin = io.read()
N = tonumber(lin)       -- mensajes a enviar ( = niveles del árbol binario - 1) 

--------------------------------
-- Creación del árbol binario --
--------------------------------

nodo = 0                -- el nivel 0 del árbol binario es la salida (0, 0)     
nodos[nodo] = {}
nodos[nodo].x = 0       -- posición x actual
nodos[nodo].y = 0       -- posición y actual
nodos[nodo].d = 0       -- distancia total recorrida

for nivel = 1, N do   
  lin = io.read()
  destx, desty = lin:match("(%-?%d+)%s+(%-?%d+)")
  destx, desty = tonumber(destx), tonumber(desty)
  for nodo = 2^nivel - 1, 2^(nivel+1) - 2, 2 do
    padre = math.floor(nodo / 2)      -- nodo padre     
    nodos[nodo] = {}                  -- hijo izquierdo 
    nodos[nodo].x = destx
    nodos[nodo].y = nodos[padre].y
    nodos[nodo].d = nodos[padre].d +  math.abs(destx - nodos[padre].x)
    nodos[nodo+1] = {}                -- hijo derecho
    nodos[nodo+1].x = nodos[padre].x
    nodos[nodo+1].y = desty
    nodos[nodo+1].d = nodos[padre].d + math.abs(desty - nodos[padre].y)
  end
end

---------------------------------------------------
-- Comprobar mínima distancia en el último nivel --
---------------------------------------------------

minimo = nodos[2^N - 1].d
for nodo = 2^N - 1, 2^(N+1) - 2 do
  if (nodos[nodo].d < minimo) then minimo = nodos[nodo].d; end
end
print(minimo)

os.exit()
