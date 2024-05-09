{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
factorial :: Int -> Int
factorial n | n == 0 = 1
            | n > 0 = n*factorial (n-1)

esPar :: Int -> Bool
esPar n | n == 0 = True
        | n == 1 = False
        | otherwise = esPar (n-2)

esPar1 :: Int -> Bool
esPar1 n | n == 0 = True
         | otherwise = not (esPar1 (n-1))

sumarPrimerosNImp :: Int -> Int
sumarPrimerosNImp n
        | n == 1 = 1
        | n > 1 = 2*n - 1 + sumarPrimerosNImp (n-1)

sumDivisoresHasta :: Int -> Int -> Int
sumDivisoresHasta n k
        | k == 1 = 1
        | mod n k == 0 = k + sumDivisoresHasta n (k-1)
        |otherwise = sumDivisoresHasta n (k-1)

sumDivisores :: Int -> Int
sumDivisores n = sumDivisoresHasta n n

todosDigitosIguales :: Int -> Bool
todosDigitosIguales n
        | n < 10 = True
        | otherwise = primerDig n == segundoDig n && todosDigitosIguales (sacarPrimerDig n)

primerDig :: Int -> Int
primerDig n = mod n 10

segundoDig :: Int -> Int
segundoDig n = mod (div n 10) 10

sacarPrimerDig :: Int -> Int
sacarPrimerDig n = div n 10

sumatoriaInt :: Int -> Int -> Int
sumatoriaInt n m
        | m == 0 = 0 -- m == 1 = n
        | otherwise = n^m + sumatoriaInt n (m-1)

sumatoriaExt :: Int -> Int -> Int
sumatoriaExt n m
        | n == 0 = 0 -- n == 1 = sumatoriaInt 1 m  
        | otherwise = sumatoriaInt n m + sumatoriaExt (n-1) m

longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs
--No es lo mas efectivo
--Existe la funcion sum que hace lo mismo 

pertenece :: Char -> [Char] -> Bool
pertenece _ [] = False
pertenece n x = n == head x || pertenece n (tail x)

sacarEspaciosRep :: [Char] -> [Char]
sacarEspaciosRep [] = []
sacarEspaciosRep [x] = [x]
sacarEspaciosRep (x:y:xs)
        | x == y && x == ' ' = sacarEspaciosRep (y:xs)
        | otherwise = x:sacarEspaciosRep (y:xs)

sacarEspacioFin :: [Char] -> [Char]
sacarEspacioFin [] = []
sacarEspacioFin [x]
        | x == ' ' = []
        | otherwise = [x]
sacarEspacioFin (x:xs) = x:sacarEspacioFin xs

sacarEspaciosInFin :: [Char] -> [Char]
sacarEspaciosInFin [] = []
sacarEspaciosInFin (x:xs)
        | x == ' ' = sacarEspacioFin xs
        | otherwise = x:sacarEspacioFin xs

contarEspacios :: [Char] -> Int
contarEspacios [] = 0
contarEspacios (x:xs)
        | x == ' ' = 1 + contarEspacios xs
        | otherwise = contarEspacios xs

contarPalabras :: [Char] -> Int
contarPalabras xs = contarEspacios (sacarEspaciosInFin (sacarEspaciosRep xs)) + 1

palabras :: [Char] -> [[Char]]
palabras xs = palabrasAux (sacarEspaciosInFin (sacarEspaciosRep xs))

palabrasAux :: [Char] -> [[Char]]
palabrasAux [] = []
palabrasAux (x:xs) = primeraPalabra (x:xs) : palabrasAux (sacarPrimeraPalabra (x:xs))

primeraPalabra :: [Char] -> [Char]
primeraPalabra [x] = [x]
primeraPalabra (x:xs)
        | x == ' ' = []
        | otherwise = x : primeraPalabra xs

sacarPrimeraPalabra :: [Char] -> [Char]
sacarPrimeraPalabra [] = []
sacarPrimeraPalabra (x:xs)
        | x == ' ' = xs
        | otherwise = sacarPrimeraPalabra xs


palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = palabraMasLargaAux (sacarEspaciosInFin (sacarEspaciosRep xs))

longitudPal :: [Char] -> Int
longitudPal [] = 0
longitudPal (x:xs) = 1 + longitudPal xs

palabraMasLargaAux :: [Char] -> [Char]
palabraMasLargaAux xs
        | longitudPal (primeraPalabra xs) > longitudPal (primeraPalabra (sacarPrimeraPalabra xs)) = primeraPalabra xs
        | otherwise = primeraPalabra (sacarPrimeraPalabra xs)

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = sacarEspaciosInFin (sacarEspaciosRep x) ++ aplanar xs

sacarEspacios :: [Char] -> [Char]
sacarEspacios [] = []
sacarEspacios [x]
        | x == ' ' = []
        | otherwise = [x]
sacarEspacios (x:xs)
        | x == ' ' = sacarEspacios xs
        | otherwise = x : sacarEspacios xs

