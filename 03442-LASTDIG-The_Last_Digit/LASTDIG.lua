c2 = {2, 4, 8, 6}
c3 = {3, 9, 7, 1}
c4 = {4, 6, 4, 6}
c7 = {1, 7, 9, 3}
c8 = {8, 4, 2, 6}
c9 = {9, 1, 9, 1}
l = io.read()
N = tonumber(l)
for i = 1, N do
  l = io.read()
  x, y = string.match(l, "(%-?%d+)%s+(%-?%d+)")
  x = tonumber(x)
  y = tonumber(y)
  x = x % 10
  if (y==0) then print(1)
  else
    if (x < 2) or (x == 5) or (x == 6) then print(x)
    elseif (x == 2) then print(c2[((y - 1) % 4) + 1])
    elseif (x == 3) then print(c3[((y - 1) % 4) + 1])
    elseif (x == 4) then print(c4[((y - 1) % 4) + 1])
    elseif (x == 7) then print(c7[(y % 4) + 1])
    elseif (x == 8) then print(c8[((y - 1) % 4) + 1])
    else print(c9[((y - 1) % 4) + 1])
    end
  end
end
