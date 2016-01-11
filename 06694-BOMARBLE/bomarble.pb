; 5				                  = 5 
; 5 + 3*1 + 4*1			        = 12
; 5 + 3*2 + 3*1 + 4*2		    = 22
; 5 + 3*3 + 3*2 + 3*1 + 4*3	= 35
; ...                           

enableexplicit
declare main()
main()
end

procedure main()
  protected.l f, n, i, result
  
  openConsole()
  f = readFile(#PB_ANY, "stdin.txt")
  while (1)   ; un ciclo para cada caso
    n = val(readString(f))
    if (n = 0) : break : endif
    result = 5
    for i = 0 to n-1
      result + (3*i)
    next
    result + (4*(i-1))
    printN(str(result))
  wend
  
  closeFile(f)
  closeConsole()
endprocedure
