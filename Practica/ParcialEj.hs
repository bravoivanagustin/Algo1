{-
problema relacionesValidas {relaciones: seq(String x String)} : Bool 
    requiere: {True}
    asegura: {res=True <-> no hay tuplas con ambos componentes iguales en tuplas repetidas}
-}

-- relacionesValidas [(1,2), (1,3), (1,4)] = True
-- relacionesValidas [(1,2), (1,3), (1,2)] = True
-- relacionesValidas [(1,1), (1,3), (1,1)] = False
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use uncurry" #-}

relacionesValidas :: [(String,String)] -> Bool 
relacionesValidas [x] = True 
relacionesValidas [x,y] =  not(esPermutacion x y)
relacionesValidas (x:y:xs) 
    | relacionesValidas [x,y] && relacionesValidas (x:xs) && relacionesValidas (y:xs) = True 
    | otherwise = False 

esPermutacion :: (String,String) -> (String,String) -> Bool 
esPermutacion x y = (fst x == fst y && snd x == snd y) || (fst x == snd y && snd x == fst y)

