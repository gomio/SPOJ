-- TEST - Life, the Universe and Everything

-- GLOBALES -----------------------------------------------------------------------------
main = nil
-- FIN GLOBALES -------------------------------------------------------------------------

function main()
  for line in io.lines() do
    if (line == "42") then break end
    print(line)
  end
end

-----------------------------------------------------------------------------------------

main()
os.exit()
