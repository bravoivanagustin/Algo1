m :: Int -> Int
m n | n == 1 = 8
    | n == 4 = 131
    | n == 16 = 1
    |otherwise = 0

l :: Int -> Int
l n | n == 8 = 16
    | n == 16 = 4
    | n == 131 = 1
    |otherwise = 0

h :: Int -> Int
h n = m (l n)

k :: Int -> Int
k n = l (m n)

{- 

Ejercicio 2: 

problema valorAbs(x:R) : R {
    asegura(res es la distancion de x al 0)
}

problema maximo(x:R, y:R) : R {
    asegura(res es el mayor entre x e y sin son distintos, o cualquiera de ellos si son iguales)
}

maximo
-}

modulo :: Float -> Float
modulo x | x>0 = x
         | x<0 = (-1)*x
         | otherwise = 0


maximo1 :: Float -> Float -> Float
maximo1 x y | modulo x < modulo y = y
            | modulo y < modulo x = x
            |otherwise = x

maximo2 :: Float -> Float -> Float
maximo2 x y | x<y = y
            | y<x = x
            |otherwise = x 

maximo3 :: Float -> Float -> Float -> Float
maximo3 x y z | maximo2 x y <= z = z 
              | x<y = y 
              | y<x = x
              | otherwise = x

algunoEs :: Int -> Int -> String
algunoEs x y | x == 0 && y == 0 = "Ambos son 0"
             | x == 0 = "El primero es 0"
             | y == 0 = "El segundo es 0"
             | otherwise = "Ninguno es cero"

mismoIntervalo:: Float -> Float -> String
mismoIntervalo x y | x <= 3 && y <= 3 = "Pertenecen al (-inf,3]"
                   | 3 < x && 3 < y && x <= 7 && y <= 7 = "Pertencen al (3,7]"
                   | 7 < x && 7 < y = "Pertencen al (7,+inf)"
                   | otherwise = "No pertenecen al mismo intervalo"

sumaDistintos :: Float -> Float -> Float -> Float
sumaDistintos x y z | x == y && x == z = x
                    | x == z = y + x
                    | y == z = x + z
                    | x == y = y + z
                    | otherwise = x + y + z

resto :: Int -> Int -> Int
resto x y = x - (x `div` y)*y

esMultiploDe :: Int -> Int -> String
esMultiploDe x y | x == y = "Son iguales" 
                 | resto x y == 0 = "El primero es multiplo del segundo"
                 | resto y x == 0 = "El segundo es multplo del primero"
                 | otherwise = "Ninguno es multiuplo del otro"

digitoUnidades :: Int -> Int
digitoUnidades x = resto x 10

digitoDecenas :: Int -> Int
digitoDecenas x = (resto x 100 - resto x 10) `div` 10 

estanRelacionados:: Int -> Int -> Bool
estanRelacionados a b 
    | a /= 0 && b /= 0 && a*a + a*b*k == 0 = True
    | otherwise = False
    where k = -(a `div` b)

prodInterno :: (Float,Float) -> (Float,Float) -> Float
prodInterno (a,b) (c,d) = a*c + b*d

todoMenor :: (Float,Float) -> (Float,Float) -> Bool
todoMenor (a,b) (c,d)
    | a < c && b < d = True
    |otherwise = False

distanciaPuntos :: (Float,Float) -> (Float,Float) -> Float
distanciaPuntos (a,b) (c,d) = sqrt((c-a)^2+(d-b)^2)


sumaSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumaSoloMultiplos (x, y, z) n  
    | mod x n == 0 && mod y n == 0 && mod z n == 0 = x + y + z
    | mod x n == 0 &&  mod y n == 0 = x + y
    | mod y n == 0 && mod z n == 0 = y + z 
    | mod x n == 0 &&  mod z n == 0 = x + z
    | mod x n == 0 = x 
    | mod y n == 0 = y 
    | mod z n == 0 = z
    | otherwise = 0

posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (x, y, z) 
    | even x = 1
    | even y = 2
    | even z = 3
    | otherwise =4

crearPar :: ta -> tb -> (ta,tb)
crearPar a b = (a,b)

invertirPar :: (ta,tb) -> (tb,ta)
invertirPar (a,b) = (b,a)


{-
problema todosMenores ((n1,n2,n3) : Z × Z × Z) : Bool {
requiere: {T rue}
asegura: {(res = true) ↔ ((f(n1) > g(n1)) ∧ (f(n2) > g(n2)) ∧ (f(n3) > g(n3))))}
}
problema f (n: Z) : Z {
requiere: {T rue}
asegura: {(n ≤ 7 → res = n
2
) ∧ (n > 7 → res = 2n − 1)}
}
problema g (n: Z) : Z {
requiere: {T rue}
asegura: {Si n es un n´umero par, entonces res = n/2, en caso contrario, res = 3n + 1}
}
-}

todosMenores :: (Int,Int,Int) -> Bool
todosMenores (x,y,z) 
    | f x > g x &&  f y > g y && f z > g z = True
    | otherwise = False

f :: Int -> Int
f n | n <= 7 = n^2
    | n > 7 = 3*n - 1

g :: Int -> Int
g n | even n = n `div` 2
    | otherwise = 3*n -1


{-
problema bisiesto (a˜no: Z) : Bool {
requiere: {T rue}
asegura: {res = f alse ↔ a˜no no es m´ultiplo de 4 o a˜no es m´ultiplo de 100 pero no de 400}
}
-}

bisiesto :: Int -> Bool
bisiesto n = not(mod n 4 /= 0 || (mod n 100 == 0 && mod n 400 /= 0)) 

bisiesto2 :: Int -> Bool
bisiesto2 n = mod n 4 == 0 && (mod n 100 /= 0 || mod n 400 == 0)

{-
distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float
problema distanciaManhattan (p : R × R × R, q : R × R × R) : R {
requiere: {T rue}
asegura: {res = sumatoria de i=0 hasta 2 |pi − qi|}
}
-}

distanciaManhattan:: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a,b,c) (d,e,f) = abs(d-a) + abs(e-b) + abs(f-c)

{-
problema comparar (a:Z, b:Z) : Z {
requiere: {T rue}
asegura: {(res = 1 ↔ sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b))}
asegura: {(res = −1 ↔ sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b))}
asegura: {(res = 0 ↔ sumaUltimosDosDigitos(a) = sumaUltimosDosDigitos(b)))}
}
problema sumaUltimosDosDigitos (x: Z) : Z {
requiere: {T rue}
asegura: {res = (x mod 10) + ((x/10) mod 10)}
}
-}

sumaUltDigitos :: Int -> Int
sumaUltDigitos x = mod x 10 + mod (div x 10) 10

comparar :: Int -> Int -> Int
comparar a b 
    | sumaUltDigitos a < sumaUltDigitos b = 1
    | sumaUltDigitos b < sumaUltDigitos a = -1
    | sumaUltDigitos a == sumaUltDigitos b = 1

fst3 :: (t1,t2,t3) -> t1
fst3 (a,b,c) = a 

snd3 :: (t1,t2,t3) -> t2
snd3 (a,b,c) = b

trd3 :: (t1,t2,t3) -> t3
trd3 (a,b,c) = c 

esOrigen :: (Float, Float) -> Bool
esOrigen (0,0) = True
esOrigen (_,_) = False

angulo45 :: Float -> Float -> Bool
angulo45 x y = x==y && x > 0

f1 :: Float -> Float
f1 n | n == 0 = 1
     | otherwise = 0 

{-
problema f1 (x : R) : R {
    requiere: {True}
    asegura: {res es igual a 1 si solo si x es 0}
    asegura: {res es igual a 0 si solo si x es distinto de 0}
-}

f4 :: Float -> Float -> Float
f4 x y = ( x + y )/2

{-
problema f4 (x : R, y : R) : R {
    requiere: {True}
    asegura: {res es el promedio entre x e y}
}
-}

f6 :: Float -> Int -> Bool
f6 a b = truncate a == b 

{-
problema f6 (x : R, y : Z) : Bool {
    requiere: {True}
    asegura: {res = True sii x truncado es igual a y}
}
-}