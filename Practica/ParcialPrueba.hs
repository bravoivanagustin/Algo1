{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use uncurry" #-}
{-# HLINT ignore "Redundant bracket" #-}

{-
problema relacionesValidas (relaciones: seq(String x String) : Bool {
    requiere: {True}
    asegura: {res=True <-> no hay tuplas con ambos componentes iguales ni tuplas repetidas}
}
-}

relacionesValidas :: [(String,String)] -> Bool 
relacionesValidas [] = True 
relacionesValidas [x] = esValido x 
relacionesValidas (x:xs)
    | (esValido x) && esDistinto (x:xs) && relacionesValidas xs = True
    | otherwise = False

esDistinto :: [(String,String)] -> Bool
esDistinto [] = True
esDistinto (x:xs)
    | null xs = True
    | not(esPermutacion x (head xs)) && esDistinto (x:tail xs) = True 
    | otherwise = False

esValido :: (String,String) -> Bool 
esValido x 
    | (fst x /= snd x) = True
    | otherwise = False

esPermutacion :: (String,String) -> (String,String) -> Bool
esPermutacion x y = (x == y) || ((fst x == snd y) && (snd x == fst y))


{-
problema personas (relaciones: seq(String x String)) : seq(String) {
    requiere: {relacionesValidas(relaciones)}
    asegura: {res tiene exactamente todos los elementos que figuras en alguna tupla de relaciones en cualquier posicion, sin repetir}
}
-}

personasAux :: [(String, String)] -> [String]
personasAux [] = []
personasAux ((a,b):xs) = a : b : (personasAux xs)

sacarRepetidos :: [String] -> [String]
sacarRepetidos [x] = [x]
sacarRepetidos (x:xs) 
    | noRepetido (x:xs) = x : sacarRepetidos xs
    | otherwise = sacarRepetidos xs

noRepetido :: [String] -> Bool
noRepetido [] = True 
noRepetido (x:xs) 
    | null xs = True
    | x /= head xs && noRepetido (x:tail xs) = True
    | otherwise = False 

personas :: [(String, String)] -> [String]
personas x = sacarRepetidos (personasAux x)

{-
problema amigosDe (persona: String, relaciones: seq(String x String)) : seq(String) {
    requiere: {relacionesValidas(relaciones)}
    asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en la que una de sus componentes es persona}
}
amigosDe [("a","b"),("b", "c"),("b", "n"),("a","d"),("g","n")]
-}

amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe p ((a,b):xs)
    | p == a = b : amigosDe p xs 
    | p == b = a : amigosDe p xs 
    | otherwise = amigosDe p xs

{-
problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
  requiere: {relaciones no vacía}
  requiere: {relacionesValidas(relaciones)}
  asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
}
-}

personaConMasAmigosAux :: [String] -> [String] -> String
personaConMasAmigosAux _ [] = "Error"
personaConMasAmigosAux [] _ = "Error"
personaConMasAmigosAux [p] _ = p
personaConMasAmigosAux (p:ps) t
    | cantApariciones p t >= cantApariciones (head ps) t = personaConMasAmigosAux (p:tail ps) t
    | otherwise = personaConMasAmigosAux ps t

cantApariciones :: String -> [String] -> Int
cantApariciones _ [] = 0
cantApariciones p (x:xs)
    | p == x = 1 + cantApariciones p xs
    | otherwise = cantApariciones p xs

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos x = personaConMasAmigosAux (personas x) (personasAux x)

