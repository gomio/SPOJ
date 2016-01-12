-- CANDY - Candy I

-- GLOBALES -----------------------------------------------------------------------------
main, resolver = nil
-- FIN GLOBALES -------------------------------------------------------------------------

function main()
  local n, lin
  
  while (true) do
    lin = io.read()
    n = tonumber(lin)
    if (n == -1) then break; end

    print(resolver(n))
  end
end

function resolver(n)
  local paquete, lin, c, total, media, sobra
  
  paquete = {}
  total = 0
  for i = 1, n do
    lin = io.read()
    c = tonumber(lin)
    paquete[i] = c
    total = total + c
  end
  media = math.floor(total / n)
  if (media * n == total) then  -- se puede repartir
    sobra = 0
    for i = 1, n do
      if (paquete[i] > media) then
        sobra = sobra + (paquete[i] - media)
      end
    end
    return sobra
  else
    return -1
  end
end

main()
os.exit()
