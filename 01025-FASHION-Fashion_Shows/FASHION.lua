-- FASHION - Fashion Shows

-- GLOBALES -----------------------------------------------------------------------------
main, resolver = nil
-- FIN GLOBALES -------------------------------------------------------------------------

function main()
  local T, lin, n, hom, muj
  
  T = io.read()
  for i = 1, T do
    lin = io.read()
    n = tonumber(lin)
    hom = io.read()
    muj = io.read()
    print(resolver(n, hom, muj))
  end
end

-----------------------------------------------------------------------------------------

function resolver(n, hom, muj)
  local matH, matM, i, total
  
  matH = {}
  matM = {}
  i = 1
  for v in string.gmatch(hom, "(%-?%d+)") do
    matH[i] = tonumber(v)
    i = i + 1
  end
  i = 1
  for v in string.gmatch(muj, "(%-?%d+)") do
    matM[i] = tonumber(v)
    i = i + 1
  end
  table.sort(matH)
  table.sort(matM)
  total = 0
  for i = 1, n do
    total = total + (matH[i] * matM[i])
  end
  return total
end

-----------------------------------------------------------------------------------------

main()
os.exit()
