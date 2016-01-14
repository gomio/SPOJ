-- TOANDFRO - To and Fro

-- GLOBALES -----------------------------------------------------------------------------
main, resolver = nil
-- FIN GLOBALES -------------------------------------------------------------------------

function main()
  local col, txt, long
  
  while (true) do
    txt = io.read()
    col = tonumber(txt)
    if (col == 0) then break; end
    txt = io.read()
    long = string.len(txt)
    print(resolver(col, txt, long))
  end
end

function resolver(col, txt, long)
  local x, y, dir, mat, filas, result

  mat = {}
  filas = tonumber(long / col)
  for i = 1, col do mat[i] = {}; end
  x = 1; y = 1; dir = 1
  for i = 1, long do
    mat[x][y] = string.sub(txt, i, i)
    x = x + dir
    if (x > col) or (x < 1) then
      y = y + 1
      x = x - dir
      dir = -dir
    end
  end
  result = ""
  for x = 1, col do
    for y = 1, filas do
      result = result .. mat[x][y]
    end
  end
  return result
end

main()
os.exit()
