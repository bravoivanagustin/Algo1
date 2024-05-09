import random as r
import numpy as np
# Sigo la guia 7

# 9 
def tiene_3_vocales(c: str) -> bool:
    res: bool = False
    vocales = 0
    if ("a" in c) or ("e" in c) or ("i" in c) or ("o" in c) or ("u" in c):
        vocales += 1
    if vocales >= 3:
        res: bool = True
    return res

# Ejercicio 2

# 1
def borrar_pares(s: [int]) -> [int]:
    for i in range(0,len(s),1):
        if s[i]%2 == 0:
            s[i] = 0
    return s

# 2 
def borrar_pares2(s: [int]) -> [int]:
    res: [int] = [] + s 
    for i in range(0,len(res),1):
        if res[i]%2 == 0:
            res[i] = 0
    return res

# 3
def borrar_vocales(palabra: str) -> str:
    res: str = ""
    vocales: [str] = ["a","e","i","o","u"]
    for i in range(0,len(palabra),1):
        if palabra[i] not in vocales:
            res += palabra[i]
        else:
            pass
    return res

# 4 
def remplaza_vocales(palabra: str) -> str:
    res: str = ""
    vocales: [str] = ["a","e","i","o","u"]
    for i in range(0,len(palabra),1):
        if palabra[i] not in vocales:
            res += palabra[i]
        else:
            res += "_"
    return res

# 5
def dar_vuelta_str(palabra: str) -> str:
    res: str = ""
    for i in range(0,len(palabra),1):
        res += palabra[len(palabra)-1-i]
    return res

# 6
def eliminar_repetidos(s: str) -> str:
    res: str = ""
    for i in range(0,len(s),1):
        if s[i] not in res:
            res += s[i]
    return res 

# Ejercicio 3
def aprobado(notas: [int]) -> int:
    mas_de_cuatro: bool = True
    res: int = 2
    for i in range(0,len(notas),1):
        if notas[i] < 4:
            mas_de_cuatro = False
    promedio: float = sum(notas) / len(notas)
    if mas_de_cuatro == False:
        res: int = 3
    elif promedio > 7:
        res: int = 1 
    return res

# Ejercicio 4
# 1
def estudiantes() -> [str]:
    estudiante: str = str(input("Ingrese el nombre del estudiante y listo para terminar:"))
    res: [str] = []
    while estudiante != "listo":
        res.append(estudiante)
        estudiante = str(input("Ingrese el nombre del estudiante y listo para terminar:"))
    return res

# 2
def historial_tarjeta() -> [(str,int)]:
    historial: [(str,int)] = []
    monto: int = 0
    accion: str = input("Seleccione una operacion: ")
    while accion != "X":
        monto = int(input("Seleccione un monto: "))
        historial.append([accion,monto])
        accion = str(input("Seleccione una operacion: "))
    return historial

# 3
def siete_y_medio() -> (str,[float]):
    cartas: list = [x for x in range(1,13,1)]
    cartas_elegidas: list = []
    suma_cartas: float = 0
    eleccion: str = input("Bienvenido al 7 y medio, queres jugar? ")
    while eleccion == "Si" or eleccion == "si" or eleccion== "SI" or eleccion == "sI":
        nueva_carta = r.choice(cartas)
        cartas.remove(nueva_carta)
        cartas_elegidas.append(nueva_carta)
        if nueva_carta < 10:
            suma_cartas += nueva_carta
        else:
            suma_cartas += 0.5
        eleccion: str = input("Queres otra carta?: ")
    if suma_cartas > 7.5:
        res: (str,[float]) = (f"Perdiste, sumaste {suma_cartas}" , cartas_elegidas)
    else:
        res: (str,[float]) = (f"Ganaste, sumaste {suma_cartas}" , cartas_elegidas)
    return res

# Ejercicio 5

# 1
def pertenece_a_todos(s: [[int]], e: int, res: [bool]):
    res.clear()
    i: int = 0 
    while i < len(s):
        res.append(e in s[i])
        i += 1

#2 
def es_matriz(s: [[int]]) -> bool:
    res: bool = True
    largo: int = len(s[0])
    for i in range(0,len(s),1):
        if len(s[i]) != largo:
            res = False
    return res 

#3
def ordenados(s: list) -> bool:
    res: bool = True
    contador = 0
    while contador < (len(s)-1):
        if s[contador] > s[contador + 1]:
            res = False
        contador += 1 
    return res 

def filas_ordenadas(m: [[int]], res: [bool]):
    res.clear()    #preguntar porque aca sirve tener res.clear() pero no pones res = []
    for i in range(0,len(m),1):
        res.append(ordenados(m[i]))

#4

def producto_matriz(m: [[int]], n: [[int]]) -> [[int]]:
    columnas: [[int]] = []
    for fila in range(0,len(m),1):
        filas: [int] = []     # averiguar/preguntar bien la diferencia entre usar clear y definidir como []
        for columna in range(0,len(m),1):
            suma: int = 0
            for contador in range(0,len(m),1):
                suma += (m[fila][contador]) * (m[contador][columna])
            filas.append(suma)
        columnas.append(filas)        
    return columnas  

def potencia_matriz(d: int, p: int) -> [[int]]:
    m: [[int]] = np.random.randint(0,100,(d,d))
    print(m)
    res: [[int]] = m.copy()
    for i in range(1,p,1):
        res = producto_matriz(res,m)
    return res
