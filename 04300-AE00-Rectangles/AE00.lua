-- AE00 - Rectangles

-- GLOBALES -----------------------------------------------------------------------------
main, resolver = nil
-- FIN GLOBALES -------------------------------------------------------------------------

function main()
  local lin, N
  
  lin = io.read()
  N = tonumber(lin)
  print(resolver(N))
end

-----------------------------------------------------------------------------------------

function resolver(n)
  local r, j

  r = 0
  for i = 1, n do
    j = i
    while (i*j <= n) do
      --print(i .. " x " .. j)
      r = r + 1
      j = j + 1
    end
  end
  return r
end

-----------------------------------------------------------------------------------------

main()
os.exit()
