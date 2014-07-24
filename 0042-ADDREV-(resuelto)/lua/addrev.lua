
local N, i, c1, c2, csum, carry, c1, c2, p1, p2
local lin, result, res

function main()
  -- Obtener número de casos
  lin = io.read()
  result = ""
  N = math.floor(lin)
  
  -- Análisis de cada caso
  for i = 0, N-1 do
    res = result
    lin = io.read()
    -- Buscar comienzo de primer número
    p1 = 1
    while (string.sub(lin, p1, p1) < "0") do p1 = p1 + 1 end
    -- Buscar comienzo de segundo número
    p2 = p1
    while (string.sub(lin, p2, p2) >= "0") do p2 = p2 + 1 end
    while (string.sub(lin, p2, p2) < "0")  do p2 = p2 + 1 end
    fin1, fin2 = false, false
    carry = 0
    while (true)
      c1 = string.sub(lin, p1, p1)
      if (c1 < "0") then
        c1 = "0"
        fin1 = true
        p1 = p1 - 1
      end
      c2 = string.sub(lin, p2, p2)
      if (c2 < "0") then
        c2 = "0"
        fin2 = true
        p2 = p2 - 1
      end
      
  end
end

main()
os.exit()

