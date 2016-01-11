
enableexplicit

declare main()

main()
end

procedure main()
  protected.l f, i, j, clases, alumnos, nota
  protected.s dim notas(1000000)
  protected.s lin
  protected.l T, A, B, D, Dmin
  
  openConsole()
  f = readFile(#pb_Any, "stdin.txt")
  
  while (1) ; un ciclo por cada caso
    lin = readString(f)
    if ((val(lin) = -1) or eof(f)) : break : endif
    clases = val(lin)
    
    ; Almacenar datos del caso
    for i = 0 to clases-1
      lin = readString(f)   ; nº de alumnos
      notas(i) = lin + " "
      lin = readString(f)
      notas(i) + lin        ; nº de alumnos + lista de notas
    next
    
    ; Análisis del caso: busqueda de T que minimiza la suma de las
    ; diferencias entre nº de alumnos de tipo A y B en cada clase.
    for T = 0 to 1000
      D = 0
      for i = 0 to clases-1
        alumnos = val(stringField(notas(i), 1, " "))
        A = 0 : B = 0
        for j = 0 to alumnos-1
          nota = val(stringField(notas(i), j+2, " "))
          if (nota >= T)
            A + 1
          else
            B + 1
          endif
        next
        D = D + abs(A - B)
      next
      if ((D < Dmin) or (T = 0))
        Dmin = D
      endif
    next
    printN(str(Dmin))
  wend
  closeFile(f)
  closeConsole()
endprocedure
