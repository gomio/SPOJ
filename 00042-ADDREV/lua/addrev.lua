
local N, i, c1, c2, csum, carry, c1, c2, p1, p2
local lin, res

function main()
  -- Obtener número de casos
  lin = io.read()
  N = math.floor(lin)
  
  -- Análisis de cada caso
  for i = 0, N-1 do
    res = ""
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
    while (true) do
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
      if (fin1 and fin2) then
        if (carry == 1) then res = res .. "1" end
        break
      end
      csum = string.byte(c1) - string.byte("0")
      csum = csum + string.byte(c2) - string.byte("0")
      csum = csum + carry
      if (csum > 9) then
        csum = csum - 10
        carry = 1
      else
        carry = 0
      end
      res = res .. string.char(csum + string.byte("0"))
      p1 = p1 + 1
      p2 = p2 + 1
    end
    -- Quitar ceros delante y detrás del resultado
    p1 = 1
    while (string.sub(res, p1, p1) == "0") do p1 = p1 + 1 end
    p2 = -1
    while (string.sub(res, p2, p2) == "0") do p2 = p2 - 1 end
    res = string.sub(res, p1, p2)
    print(res)
  end
end

main()
os.exit()
