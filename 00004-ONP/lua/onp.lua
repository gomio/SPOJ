-- Sphere Online Judge: ONP

N = io.read()

function esletra(c)
  c = string.lower(c)
  if ((c >= 'a') and (c <= 'z')) then
    return true
  else
    return false
  end
end

function esoper(c)
  if ((c == '+') or (c == '-') or (c == '*') or (c == '/') or (c == '^')) then
    return true
  else
    return false
  end
end

function main()
  local n, expr, level, car, resp
  local op = {}
  
  for n = 1, N do
    expr = io.read()
    level = 0
    resp = ""
    for pos = 1, #expr do
      car = string.sub(expr, pos, pos)
      if (car == '(') then
        level = level + 1
      elseif (esletra(car)) then
        resp = resp .. car
      elseif (esoper(car)) then
        op[level] = car
      elseif (car == ')') then
        resp = resp .. op[level]
        level = level - 1
      end
    end
    print(resp)
  end
end

main()

os.exit()
