-- Sphere Online Judge: FCTRL2

F100 = {}   -- tabla para los primeros 100 factoriales

function rellenar_tabla()
  local cifras = {}         -- las cifras de un factorial           
  local fact                -- el factorial                         
  local carry, d            -- auxiliares en la multiplicación      
  local ultimo, i           -- índices de los dígitos del factorial 
  local n
  local digitos = {'0','1','2','3','4','5','6','7','8','9'}

  cifras[1] = 1             -- el factorial empieza valiendo 1        
  ultimo = 1                -- índice del último dígito del factorial 
  
  --bucle de cálculo de 1!, 2!, 3!, ... , 100!
  for n = 1, 100 do
    carry = 0                     -- empezar a multiplicar por n
    for i = 1, ultimo do          -- recorrer cada dígito       
      d = cifras[i] * n + carry   -- la multiplicación clásica  
      cifras[i] = d % 10          -- el dígito de menor orden   
      carry = math.floor(d / 10)  -- acarreo para el siguiente dígito
    end
    while (carry > 0) do          -- almacenar acarreo en el número 
      if (ultimo > 157) then      -- 100! tiene 158 cifras          
        print("DESBORDAMIENTO!")
        os.exit(0)
      end
      ultimo = ultimo + 1             -- un dígito más
      cifras[ultimo] = carry % 10     -- colocado     
      carry = math.floor(carry / 10)  -- acarreo reducido
    end
    fact = ""
    for i = ultimo, 1, -1 do fact = fact .. cifras[i] end
    F100[n] = fact
  end
end

function main()
  local N, n, item
  
  rellenar_tabla()
  N = io.read()
  for n = 1, N do
    item = math.floor(io.read())
    print(F100[item])
  end
end

main()
os.exit()
