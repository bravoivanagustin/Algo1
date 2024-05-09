# Ejercicio 1
def ultima_aparicion(s: list, e: int) -> int: 
    es_igual: bool = False
    res: int = len(s)
    while not(es_igual):
        a = s.pop()
        es_igual = (a == e)
        res -= 1
    return res 

# Ejercicio 2
def exclusivos(s: list, t: list) -> list: 
    res: list = []
    for i in s:
        if (i not in t) and (i not in res):
            res.append(i)
    return res 

def elementos_exclusivos(s: list, t: list) -> list:
    res: int = exclusivos(s,t) + exclusivos(t,s)
    return res 

# Ejercicio 3
def contar_traducciones_iguales(ing: dict, ale: dict) -> int:
    res: int = 0
    for i in ing: # es lo mismo si uso ing o list(ing.keys())
        if (i in ale) and (ing[i] == ale[i]):
            res += 1
    return res

# Ejercicio 4
def convertir_a_diccionario(lista: list) -> dict: 
    res: dict = {}
    for i in lista:
        if (i in res):
            res[i] += 1
        else:
            res[i] = 1
    return res 

# Maneras extras de resolver
def ultima_aparicion2(s: list, e: int) -> int: 
    s1: list = []
    for i in range(0,len(s),1):
        if s[i] == e:
            s1.append(i)
    res: int = s1[-1]
    return res

def ultima_aparicion3(s: list, e: int) -> int: 
    res: int
    for i in range(0,len(s),1):
        if s[i] == e:
            res = i
    return res 

def elementos_exclusivos2(s: list, t: list) -> list: 
    res: list = []
    for i in s:
        if (t.count(i) == 0) and (res.count(i) == 0):
            res.append(i)
    for i in t:
        if (s.count(i) == 0) and (res.count(i) == 0):
            res.append(i)
    return res 

def elementos_exclusivos3(s: list, t: list) -> list: 
    res: list = []
    d: list = s + t
    for i in d:
        a = (i in d[0:len(s):1]) and (i in d[len(s):len(s)+len(t):1])
        if not(a or (i in res)):
            res.append(i)
    return res
 