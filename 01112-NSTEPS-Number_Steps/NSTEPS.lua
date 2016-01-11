--[[
NSTEPS
]]

-- GLOBALES -----------------------------------------------------------------------------
N = 0
lin = ""
punto = 0
x = 0; y = 0; r = 0
-- FIN GLOBALES -------------------------------------------------------------------------

lin = io.read()
N = tonumber(lin)   -- nº de puntos a chequear

for punto = 1, N do
  lin = io.read()
  
  x, y = lin:match("(%-?%d+)%s+(%-?%d+)")
  x = math.floor(x)
  y = math.floor(y)
  
  if (x == y) then
    r = x * 2
    if (x % 2 == 1) then  -- x impar
      r = r - 1
    end
    print(r)
  elseif (x == y+2) then
    r = (x - 1) * 2
    if (x % 2 == 1) then  -- x impar
      r = r - 1
    end
    print(r)
  else
    print("No Number")
  end
end

os.exit()
