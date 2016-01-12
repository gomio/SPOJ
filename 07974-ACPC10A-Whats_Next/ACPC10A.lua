-- ACPC10A - What's next

-- GLOBALES -----------------------------------------------------------------------------
main, resolver = nil
-- FIN GLOBALES -------------------------------------------------------------------------

function main()
  local x, y, z, lin, d0, d1
  
  while (true) do
    lin = io.read()
    x, y, z = lin:match("(%-?%d+)%s+(%-?%d+)%s+(%-?%d+)")
    x = tonumber(x)
    y = tonumber(y)
    z = tonumber(z)
    if (x == 0) and (y == 0) and (z == 0) then break; end
    d0 = y - x
    d1 = z - y
    if (d0 == d1) and (d0 ~= 0) then  -- progresión aritmética
      print("AP "..(z + d0))
    else
      print("GP "..((z * z) / y))
    end
  end
end

main()
os.exit()
