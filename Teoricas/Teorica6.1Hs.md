import Test.HUnit

--Caso de valor absoluto 
valorAbs :: Int -> Int 
valorAbs x  
    | x >= 0 = x 
    | otherwise = -x 

testSuiteValorAbs :: Test
testSuiteValorAbs = test [
    "casoPositivo" ~: valorAbs 1 ~?= 1,
    "casoNegativo" ~: valorAbs (-5) ~?= 5,
    "casoCero" ~: valorAbs 0 ~?= 0 
    ]

correrTests :: IO Counts
correrTests = runTestTT testSuiteValorAbs 
