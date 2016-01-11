--[[
SAMER08F
]]

-- GLOBALES -----------------------------------------------------------------------------
main, resolver = nil
-- FIN GLOBALES -------------------------------------------------------------------------

function main()
  local n, lin
  
  while (true) do
    lin = io.read()
    n = tonumber(lin)
    if (n == 0) then break; end

    print(resolver(n))
  end
end

function resolver(n)
  local total, cpl
  
  total = 0
  for tam = 1, n do
    cpl = n - tam + 1   -- cuadrados solapados por lado
    total = total + (cpl * cpl)
  end
  return total
end

main()
os.exit()
