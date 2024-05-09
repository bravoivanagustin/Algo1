-- Ejercicio 1

fibonacci :: Int -> Int
fibonacci i
    | i == 0 = 1
    | i == 1 = 1
    | otherwise = fibonacci (i-1) + fibonacci (i-2)

-- Ejercicio 2

parteEntera :: Float -> Float 
parteEntera n 
    | -1 < n && n < 1  = 0
    | n >= 1 = 1 + parteEntera (n-1)
    | otherwise = -1 + parteEntera (n+1)

--Ejercicio 3

{-
problema esDivisible : (x:Z, y:Z) : Z {
    requiere: {True}
    asegura: {res = valor de verdad de que x es divisible en y}
} 
-}

esDivisible1 :: Float -> Float -> Bool
esDivisible1 x y 
    | y == 1 = True 
    | x / y == parteEntera (x / y) = True
    | otherwise = False


esDivisible2 :: Int -> Int -> Bool
esDivisible2 x y 
    | x == y = True
    | x > 0 && esDivisible2 (x-y) y = True
    | otherwise = False

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
-- Ejercicio 4

sumaImpares :: Int -> Int
sumaImpares n 
    | n == 1 = 1
    | otherwise = 2*n-1 + sumaImpares (n-1)

-- Ejercicio 5

medioFact :: Int -> Int
medioFact n 
    | n == 0 = 1
    | n == 1 = 1
    | otherwise = n * medioFact (n-2)

-- Ejercicio 6

sumaDigitos :: Int -> Int
sumaDigitos n 
    | n < 10 = n
    | otherwise = mod n 10 + sumaDigitos (div n 10)

-- Ejercicio 7

todosDigitosIguales :: Int -> Bool
todosDigitosIguales n 
    | n < 10 = True 
    | otherwise = ultimoDig n == ultimoDig (sacarUltimoDig n) && todosDigitosIguales (sacarUltimoDig n) 

ultimoDig :: Int -> Int
ultimoDig n = mod n 10 

sacarUltimoDig :: Int -> Int 
sacarUltimoDig n = div n 10 

-- Ejercicio 8 

cantDigitos :: Int -> Int
cantDigitos n 
    | n < 10 = 1
    | otherwise = 1 + cantDigitos (div n 10) 

iesimoDigito :: Int -> Int -> Int
iesimoDigito n i 
    | i == cantDigitos n = ultimoDig n 
    | otherwise = iesimoDigito (sacarUltimoDig n) i


-- Ejercicio 9

esCapicua :: Int -> Bool
esCapicua n 
    | n < 10 = True
    | otherwise = ultimoDig n == primerDig n && esCapicua (sacarPrimerDig (sacarUltimoDig n))

primerDig :: Int -> Int
primerDig n = div n (10^(cantDigitos n - 1))

sacarPrimerDig :: Int -> Int
sacarPrimerDig n = n - primerDig n * (10^(cantDigitos n - 1))

-- Ejercicio 10 
--a
f1 :: Int -> Int
f1 n 
    | n == 0 = 1 
    | otherwise = 2^n + f1 (n-1)

--b
f2 :: Int -> Float -> Float
f2 n q 
    | n == 0 = 1 
    | otherwise = q^n + f2 (n-1) q  

--c
f3 :: Int -> Float -> Float
f3 n = f2 (2*n)

f3_ :: Int -> Float -> Float
f3_ n q 
    | n == 0 = 0
    | otherwise = q^(2*n) + q^(2*n-1) + f3_ (n-1) q 

--d 

f4 :: Int -> Float -> Float
f4 n q 
    | n == 0 = 1
    | otherwise = q^(2*n) + q^(2*n-1) - q^(n-1) + f4 (n-1) q

--11

factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n-1)

eAprox :: Int -> Float
eAprox 0 = 1
eAprox n = 1 / fromIntegral(factorial n) + eAprox (n-1)

e :: Float
e = eAprox 10

--12
sucesionUno :: Int -> Float 
sucesionUno 1 = 2 
sucesionUno n = 2 + 1 / sucesionUno (n-1)

aproximarRaizDos :: Int -> Float
aproximarRaizDos n = sucesionUno n - 1

--14
sumatoriaPot :: Int -> Int -> Int
sumatoriaPot n q 
    | n == 0 = 0 
    | otherwise = q^n + sumatoriaPot (n-1) q  

sumaPotencia :: Int -> Int -> Int -> Int
sumaPotencia n m q = sumatoriaPot n q + sumatoriaPot m q

--15

sumatoriaP :: Int -> Int 
sumatoriaP 1 = 1 
sumatoriaP n = n + sumatoriaP (n-1)

sumatoriaQ :: Int -> Float
sumatoriaQ 1 = 1 
sumatoriaQ m = 1 / fromIntegral m + sumatoriaQ (m-1)

sumaRacionales :: Int -> Int -> Float 
sumaRacionales n m = fromIntegral(sumatoriaP n) * sumatoriaQ m 

--16
--a
menorDivisorHasta :: Int -> Int -> Int
menorDivisorHasta _ 1 = 1 
menorDivisorHasta n i 
    | mod n i == 0 && menorDivisorHasta n (i-1) == 1 = i
    | otherwise = menorDivisorHasta n (i-1) 

menorDivisor :: Int -> Int
menorDivisor n = menorDivisorHasta n n 

--b

esPrimo :: Int -> Bool 
esPrimo n 
    | menorDivisor n == n = True
    | otherwise = False 

esPrimoo :: Int -> Bool 
esPrimoo n = esPrimooHasta n (n-1) 

esPrimooHasta :: Int -> Int -> Bool 
esPrimooHasta _ 1 = True  
esPrimooHasta n k 
    | mod n k == 0 = False 
    | otherwise = esPrimooHasta n (k-1) 

--c 


sonCoprimos :: Int -> Int -> Bool
sonCoprimos 1 _ = True  
sonCoprimos _ 1 = True 
sonCoprimos n m 
    | mod n m == 0 || mod m n == 0 = False 
    | n > m = sonCoprimos (n-m) m 
    | otherwise = sonCoprimos n (m-n)

-- d 
