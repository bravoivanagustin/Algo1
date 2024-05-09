#Ejercicio 1
# 1
def pertenece1(s: list, e: int) -> bool: 
    res: bool = e in s
    return res 

def pertenece2(s: list, e: int) -> bool: 
    res: bool = False
    for elem in s:
        if elem == e:
            res = True
    return res

def pertenece3(s: list, e: int) -> bool: 
    res: bool = False
    contador = 0
    while contador < len(s):
        if s[contador] == e:
            res = True
        contador += 1
    return res 

# Vale en cualquiera de los casos

# 2
def divideATodos(s: list, e: int) -> bool: 
    res: bool = True
    for elem in s: 
        if elem%e != 0:
            res = False
    return res 

# 3 
def sumaTotal(s: list) -> int:
    res: int = 0
    for elem in s: 
        res += elem
    return res

# 4
def ordenados(s: list) -> bool:
    res: bool = True
    contador = 0
    while contador < (len(s)-1):
        if s[contador] > s[contador + 1]:
            res = False
        contador += 1 
    return res 

# 5
def alguna_palabra_larga(s:list) -> bool:
    res: bool = False 
    for elem in s:
        if len(elem) > 7:
            res = True
    return res 

# 6 
def es_palindromo(s: str) -> bool:
    res: bool = True
    contador: int = 0
    while contador < len(s):
        if s[contador] != s[len(s)-contador-1]:
            res = False
        contador += 1
    return res

# 7
def buena_contraseña(c: str) -> str:
    res: str = "AMARILLA"
    letras_min: int = 0
    letras_may: int = 0
    numeros: int = 0
    for char in c:
        if char.upper() == char.lower():
            numeros += 1
        elif char == char.upper():
            letras_may += 1
        elif char == char.lower():
            letras_min += 1
        else: 
            pass
    if len(c) < 5:
        res: str = "ROJA"
    elif len(c) > 8 and letras_may > 0 and letras_min > 0 and numeros > 0:
        res: str = "VERDE"
    return res 

# 8
def banco(s: list) -> int: 
    res: int = 0
    for dupla in s:
        if dupla[0] == "I":
            res += dupla[1]
        else:
            res -= dupla[1]
    return res 
