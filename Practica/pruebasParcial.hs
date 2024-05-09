import Test.HUnit
import IntentoParcial

testRelacionesValidas = test [
    "lista vacia" ~: relacionesValidas [] ~?= True,
    "tupla no valida" ~: relacionesValidas [("a","a")] ~?= False,
    "lista no valida" ~: relacionesValidas [("a","b"),("b","a")] ~?= False,
    "tupla valida" ~: relacionesValidas [("a","b")] ~?= True,
    "lista no valida" ~: relacionesValidas [("a","b"),("c","a")] ~?= True
    ]

testearRelaciones = runTestTT testRelacionesValidas

testPersonas = test [
    "lista vacia" ~: personas [] ~?= [],
    "unica tupla" ~: personas [("a","b")] ~?= ["a","b"],
    "varias tuplas" ~: personas [("a","b"),("c","a")] ~?= ["a","b","c"] 
    ]

testearPersonas = runTestTT testPersonas
