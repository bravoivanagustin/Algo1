module IntentoParcial where
-------------------------1-----------------------------

relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs) = tuplaValida x xs && relacionesValidas xs

tuplaValida :: (String,String) -> [(String,String)] -> Bool
tuplaValida (a,b) [] = a /= b
tuplaValida (a,b) ((c,d):r) = (a /= b) && ((a,b) /= (c,d)) &&  ((a,b) /= (d,c)) && tuplaValida (a,b) r 

-------------------------2-----------------------------

personasAux :: [(String, String)] -> [String]
personasAux [] = []
personasAux ((a,b):xs) = a : b : personasAux xs

sacarRepetidos :: [String] -> [String]
sacarRepetidos [x] = [x]
sacarRepetidos (x:xs) 
    | pertenece x xs = sacarRepetidos xs
    | otherwise = x : sacarRepetidos xs

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece p (x:xs) 
    | x == p || pertenece p xs = True
    | otherwise = False

personas :: [(String, String)] -> [String]
personas [] = []
personas x = sacarRepetidos (personasAux x)

--Hay maneras para hacerlo en menos codigo pero siento que no es claro con las signaturas

-------------------------3-----------------------------

amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe p ((a,b):xs)
    | p == a = b : amigosDe p xs 
    | p == b = a : amigosDe p xs 
    | otherwise = amigosDe p xs

-------------------------4-----------------------------

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

-- Otra manera es usar amigosDe y lenght (igual me dijeron que tenia que crear la funcion lenght)

personaConMasAmigos1 :: [(String,String)] -> String
personaConMasAmigos1 x = mayorCantidadAmigos (personas x) x 

mayorCantidadAmigos :: [String] -> [(String,String)] -> String
mayorCantidadAmigos [x] _ = x 
mayorCantidadAmigos [x,y] p 
    | length (amigosDe x p) > length (amigosDe y p) = x
    | otherwise = y 
mayorCantidadAmigos (x:xs) p
    | length (amigosDe x p) > length (amigosDe (mayorCantidadAmigos xs p) p) = x 
    | otherwise = mayorCantidadAmigos xs p 

-- Preguntar si usar los where se pueden usar en el sentido de que son menos claros con la signatura pero ocupan menos espacio