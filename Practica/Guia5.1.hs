-- Guia 5
-- 1.1
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--1.2
ultimo :: [t] -> t
ultimo [] = error "Error, lista vacia"
ultimo (x:xs)
    | longitud xs == 0 = x
    | otherwise = ultimo xs

--1.3
principio :: [t] -> [t]
principio [] = []
principio [x] = []
principio (x:xs) = x : principio xs

--1.4
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

--2.1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) = n == x || pertenece n xs

--2.2
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:xs)
    | (x == head xs) && todosIguales xs = True
    | otherwise = False

--2.3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs)
    | x /= head xs && todosDistintos (x:tail xs) && todosDistintos xs = True
    | otherwise = False

--2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs)
    | null xs = False
    | x == head xs || hayRepetidos (x:tail xs) = True
    | otherwise = hayRepetidos xs

--2.5 
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs)
    | n == x = xs
    | otherwise = x : quitar n xs

--2.6
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n x
    | pertenece n (quitar n x) = quitarTodos n (quitar n x)
    | otherwise = quitar n x

--2.7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs)
    | pertenece x xs = x : eliminarRepetidos (quitarTodos x xs)
    | otherwise = x : eliminarRepetidos xs

--2.8 
elementosContenidos :: (Eq t) => [t] -> [t] -> Bool
elementosContenidos _ [] = False
elementosContenidos [] _ = True
elementosContenidos (x:xs) y
    | pertenece x y && elementosContenidos xs y = True
    | otherwise = False

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos x y = elementosContenidos x y && elementosContenidos y x

--2.9 
capicua :: (Eq t) => [t] -> Bool
capicua [x] = True
capicua (x:xs)
    | x == ultimo xs = capicua (principio xs)
    | otherwise = False

-- 3.1
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--3.2 
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x + productoria xs

-- 3.3
maximo :: [Int] -> Int
maximo [] = error "No hay elementos en la lista vacia"
maximo (x:xs) 
    | null xs = x
    | x >= head xs && maximo(x:tail xs) == x = x 
    |otherwise = maximo xs 

--3.4 
sumarN :: Int -> [Int] -> [Int]
sumarN _ [] = []
sumarN n (x:xs) = (n+x) : sumarN n xs

--3.5
sumarPrimero :: [Int] -> [Int]
sumarPrimero (x:xs) = sumarN x (x:xs)

-- 3.6
sumarUltimo :: [Int] -> [Int]
sumarUltimo [] = []
sumarUltimo (x:xs) = (x + ultimo (x:xs)) : sumarUltimo xs 

-- 3.7 
pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) 
    | even x = x : pares xs  
    | otherwise = pares xs 

-- 3.8 
multiplosN :: Int -> [Int] -> [Int] 
multiplosN _ [] = []
multiplosN n (x:xs) 
    | n == 0 && x == 0 = [0]
    | mod x n == 0 = x : multiplosN n xs 
    | otherwise = multiplosN n xs 

-- 3.9 
ordenarDecreciente :: [Int] -> [Int]
ordenarDecreciente [] = []
ordenarDecreciente [x] = [x] 
ordenarDecreciente (x:xs) 
    | maximo (x:xs) == x = x : ordenarDecreciente xs
    | otherwise = maximo xs : ordenarDecreciente (x : quitar (maximo xs) xs) 

ordenarCreciente :: [Int] -> [Int]
ordenarCreciente x = reverso (ordenarDecreciente x)

-- 4.1
sacarEspaciosRep :: [Char] -> [Char]
sacarEspaciosRep [] = []
sacarEspaciosRep [x] = [x]
sacarEspaciosRep (x:y:xs) 
        | x == y && x == ' ' = sacarEspaciosRep (y:xs)
        | otherwise = x:sacarEspaciosRep (y:xs) 

-- 4.2
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

-- 4.3
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

-- 4.4
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = palabraMasLargaAux (sacarEspaciosInFin (sacarEspaciosRep xs))

longitudPal :: [Char] -> Int
longitudPal [] = 0
longitudPal (x:xs) = 1 + longitudPal xs  
 
palabraMasLargaAux :: [Char] -> [Char]
palabraMasLargaAux xs 
        | longitudPal(primeraPalabra xs) > longitudPal(primeraPalabra (sacarPrimeraPalabra xs)) = primeraPalabra xs 
        | otherwise = primeraPalabra (sacarPrimeraPalabra xs)

-- 4.5
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = (sacarEspaciosInFin (sacarEspaciosRep x)) ++ aplanar xs 

sacarEspacios :: [Char] -> [Char]
sacarEspacios [] = []
sacarEspacios [x]
        | x == ' ' = []
        | otherwise = [x]
sacarEspacios (x:xs)
        | x == ' ' = sacarEspacios xs
        | otherwise = x : sacarEspacios xs

-- 4.6
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [x] = x 
aplanarConBlancos (x:xs) = sacarEspaciosInFin (sacarEspaciosRep x) ++ " " ++ aplanarConBlancos xs

-- 4.7
aplanarConNBlancos :: Int -> [[Char]] -> [Char]
aplanarConNBlancos _ [x] = x
aplanarConNBlancos n (x:xs) = sacarEspaciosInFin (sacarEspaciosRep x) ++ sumarBlancos n ++ aplanarConNBlancos n xs

sumarBlancos :: Int -> [Char]
sumarBlancos 0 = " "
sumarBlancos n = " " ++ sumarBlancos (n-1)

-- 5.1
sumaAcumuladaAux :: (Num t) => t -> [t] -> [t]
sumaAcumuladaAux n [] = []
sumaAcumuladaAux n (x:xs)
    | null xs = [x+n]
    | otherwise = (x+n) : sumaAcumuladaAux (n+x) xs

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada (x:xs) = sumaAcumuladaAux 0 (x:xs)

-- 5.2
descomponerEnPrimos :: Int -> [Int] 
descomponerEnPrimos n 
    | esPrimo n = [n]
    | otherwise = menorDivisor n : descomponerEnPrimos (div n (menorDivisor n))

descomponerEnPrimosLista :: [Int] -> [[Int]]
descomponerEnPrimosLista [] = []
descomponerEnPrimosLista (x:xs) = descomponerEnPrimos x : descomponerEnPrimosLista xs

--Funciones extras que me facilitaban el problema 5.2 (las podia hacer sin pero escribia el mismo codigo o mas todavia)
menorDivisorHasta :: Int -> Int -> Int
menorDivisorHasta _ 1 = 1 
menorDivisorHasta n i 
    | mod n i == 0 && menorDivisorHasta n (i-1) == 1 = i
    | otherwise = menorDivisorHasta n (i-1) 

menorDivisor :: Int -> Int
menorDivisor n = menorDivisorHasta n n 


esPrimoHasta :: Int -> Int -> Bool
esPrimoHasta _ 1 = True
esPrimoHasta n k 
    | mod n k /= 0 && esPrimoHasta n (k-1) = True
    | otherwise = False 

esPrimo :: Int -> Bool 
esPrimo n = esPrimoHasta n (n-1)