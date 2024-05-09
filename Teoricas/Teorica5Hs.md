Polimorfismo (ya vimos pero repaso)
    Funciones que puede usar cualquier tipo de datos/variables
    Clases de tipos: Conjuntos de tipo y de operaciones que actuan sobre estos tipos

Como especificar con Polimorfismo?
    Los parametros o resultados pueden ser de una clase/variable de tipo
    Ej: 
    problema identidad(t:T) : T {
        asegura: {res = t}
    }
    problema segundo(x:X, y:Y) : Y {
        asegura: {res = y}
    }
    problema suma(x:T, y:T) : T {
        requiere: {T es N,Z o R}
        asegura: {res = x+y}
    }

Listas: 
Nos permiten trabajar con cantidades arbitrarias de elementos
Las listas tienen todos elementos del mismo tipo

    Funciones de Haskell para listas:
    - head :: [a] -> a -- Devuelve el primer elemento de la lista 
    - tail :: [a] -> [a] -- Devuelve la lista sin el primer elemento 
    - (:) :: a -> [a] -> [a] -- Agrega un valor a la lista como primer elemento
    - reverse :: [a] -> [a] -- Devuelve la lista revertida
    - ++ :: [a] -> [a] -> [a] -- Concatena las dos listas 


longitud (x:xs) = 1 + longitud xs -> usa funciones constructuras (:)

longitud xs = 1 + longitud(tail xs) -> usa funciones observadoras (tail)

Aprender a usar pattern matching, no siempre sirve guardas. 

[] -- Lista vacia
(x:[]) -- Lista de un elemento exactamente
(x:xs) -- Lista de al menos un elemento 
(x:y:[]) -- Lista de dos elementos exactamente
(x:y:xs) -- Lista de al menos dos elementos
Etc...


Practicar recursion con pattern matching
-Es muy importante el tema de entender como plantear casos bases y pasos recursivos
-Tod down o bottom up