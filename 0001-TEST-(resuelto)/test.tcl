set linea ""
while {1} {
  gets stdin linea
  if {$linea == 42} break
  puts stdout $linea
}
