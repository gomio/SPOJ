-- JULKA - Julka

-- GLOBALES -----------------------------------------------------------------------------
main, resolver, sumar, restar, dividir = nil
-- FIN GLOBALES -------------------------------------------------------------------------

function main()
  local Klaudia, Natalia, tot, dif
  
  for i = 1, 10 do
    tot = io.read()
    dif = io.read()
    Klaudia, Natalia = resolver(tot, dif)
    print(Klaudia)
    print(Natalia)
  end
end

-----------------------------------------------------------------------------------------

function resolver(tot, dif)
  local kla, nat
  
  -- Resolución: se resta del total la diferencia (el resultado será forzosamente par),
  -- se divide entre dos y tenemos las manzanas de Natalia. Sumando la diferencia dif
  -- tendremos las de Klaudia.
  nat = restar(tot, dif)
  nat = dividir(nat)
  kla = sumar(nat, dif)
  return kla, nat
end

-----------------------------------------------------------------------------------------

function sumar(a, b)
  local r, sa, sb, s, carry   -- resultado, sumando a, sumando b, suma, acarreo
  
  a = string.reverse(a)
  b = string.reverse(b)
  r = ""
  carry = 0
  for i = 1, math.max(string.len(a), string.len(b)) do
    sa = tonumber(string.sub(a, i, i)) or 0
    sb = tonumber(string.sub(b, i, i)) or 0
    sb = sb + carry
    if (sa + sb > 9) then carry = 1 else carry = 0; end
    s = (sa + sb) % 10
    r = r .. tostring(s)
  end
  if (carry == 1) then r = r .. "1"; end
  r = string.reverse(r)
  return r
end

-----------------------------------------------------------------------------------------

function restar(a, b)
  local r, m, s, d, carry   -- resultado, minuendo, sustraendo, diferencia, acarreo

  a = string.reverse(a)
  b = string.reverse(b)
  r = ""
  carry = 0
  for i = 1, string.len(a) do
    m = tonumber(string.sub(a, i, i))
    s = tonumber(string.sub(b, i, i)) or 0
    s = s + carry
    if (m < s) then
      m = m + 10
      carry = 1
    else
      carry = 0
    end
    d = m - s
    r = r .. tostring(d)
  end
  r = string.reverse(r)  
  while (string.sub(r, 1, 1) == "0") and (string.len(r) > 1) do   -- quitar 0s iniciales
    r = string.sub(r, 2, -1)
  end
  return r
end

-----------------------------------------------------------------------------------------

function dividir(n)
  local r, d, c, resto    -- resultado, dividendo, cociente, resto
  
  r = ""
  resto = 0
  for i = 1, string.len(n) do
    d = tonumber(string.sub(n, i, i)) + (10 * resto)
    c = math.floor(d / 2)
    resto = d % 2
    r = r .. tostring(c)
  end
  if (string.sub(r, 1, 1) == "0") then r = string.sub(r, 2, -1); end
  return r
end

-----------------------------------------------------------------------------------------

main()
os.exit()
