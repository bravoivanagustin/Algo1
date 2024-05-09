-- 16)b)

esPrimoHasta :: Int -> Int -> Bool
esPrimoHasta _ 1 = True
esPrimoHasta n k 
    | mod n k /= 0 && esPrimoHasta n (k-1) = True
    | otherwise = False 

esPrimo :: Int -> Bool 
esPrimo n = esPrimoHasta n (n-1)

--16)d) 

nEnesimoPrimo :: Int -> Int
nEnesimoPrimo n = nEnesimoPrimoAux n 1 2

nEnesimoPrimoAux :: Int -> Int -> Int -> Int
nEnesimoPrimoAux n i k
    | n == i = k 
    | otherwise = nEnesimoPrimoAux n (i+1) (siguientePrimo k)

siguientePrimo :: Int -> Int 
siguientePrimo n 
    | esPrimo (n+1) = n+1 
    | otherwise = siguientePrimo (n+1)

--17

fibonacci :: Int -> Int 
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

esFibonacciDesde :: Int -> Int -> Bool
esFibonacciDesde n k 
    | fibonacci k == n = True
    | n == k = False
    | otherwise = esFibonacciDesde n (k+1)

esFibonacci :: Int -> Bool
esFibonacci n = esFibonacciDesde n 1

--18

mayorDigitoPar :: Int -> Int
mayorDigitoPar n
    | even (mayorDigito n) = mayorDigito n
    | otherwise = mayorDigitoPar (mod n (10^(cantDigitos n - 1)))

mayorDigito :: Int -> Int
mayorDigito n
    | n < 10 = n
    | otherwise = div n (10^(cantDigitos n - 1))

cantDigitos :: Int -> Int
cantDigitos n
    | n < 10 = 1
    | otherwise = 1 + cantDigitos(div n 10)

--19

esSumaInicialPrimos :: Int -> Bool
esSumaInicialPrimos n = esSumaInicialPrimosAux n 2

esSumaInicialPrimosAux :: Int -> Int -> Bool
esSumaInicialPrimosAux n k
    | n-k == 0 = True
    | n-k < 0 = False
    | otherwise = esSumaInicialPrimosAux (n-k) (siguientePrimo k)

--20

sumaDivisoresHasta :: Int -> Int -> Int
sumaDivisoresHasta n k
    | k == 1 = 1
    | mod n k == 0 = k + sumaDivisoresHasta n (k-1)
    | otherwise = sumaDivisoresHasta n (k-1)

sumaDivisores :: Int -> Int
sumaDivisores n = sumaDivisoresHasta n n

tomaValorMax :: Int -> Int -> Int 
tomaValorMax n m 
    | n == m = m
    | sumaDivisores m > sumaDivisores(tomaValorMax n (m-1)) = m
    | otherwise = tomaValorMax n (m-1)

--21

pitagorasRecursion :: Int -> Int -> Int -> Int
pitagorasRecursion n m r 
    | n == 0 && m^2 > r^2 = 0 
    | n == 0 && m^2 <= r^2 = 1
    | n^2 + m^2 <= r^2 = 1 + pitagorasRecursion (n-1) m r   
    | otherwise = pitagorasRecursion (n-1) m r 

pitagoras :: Int -> Int -> Int -> Int 
pitagoras n m r 
    | m == 0 = pitagorasRecursion n 0 r 
    | otherwise = pitagorasRecursion n m r + pitagoras n (m-1) r

pitagorasRecursion2 :: Int -> Int -> Int -> Int
pitagorasRecursion2 n m r 
    | m == 1 && 1 + n^2 <= r^2 = 1
    | n^2 + m^2 <= r^2 = 1 + pitagorasRecursion2 n (m-1) r
    | otherwise = pitagorasRecursion2 n (m-1) r 
    
{-Medio al pedo este segundo pero esta bien tenerlo-}
--Terminada la guia 4