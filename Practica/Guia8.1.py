from queue import LifoQueue as Pila
from queue import Queue as Cola
import random as rd
# EXTRA: funciones para tener len de una pila/cola y para tener una copia de una pila/cola sin modificarla 

def copiar_pila(p: Pila) -> Pila:
    p1: Pila = Pila()
    p2: Pila = Pila()
    while not(p.empty()):
        a = p.get()
        p1.put(a)
    while not(p1.empty()):
        a = p1.get()
        p.put(a)
        p2.put(a)
    return p2

def copiar_cola(p: Cola) -> Cola:
    p1: Cola = Cola()
    p2: Cola = Cola()
    while not(p.empty()):
        a = p.get()
        p1.put(a)
    while not(p1.empty()):
        a = p1.get()
        p.put(a)
        p2.put(a)
    return p2

def len_pila(p: Pila) -> int:
    p1 = copiar_pila(p)
    res: int = 0
    while not(p1.empty()): 
        p1.get()
        res += 1
    return res 

def len_cola(p: Cola) -> int:
    p1 = copiar_cola(p)
    res: int = 0
    while not(p1.empty()):
        p1.get()
        res += 1
    return res 

#Ejercicio 1
#1
def contar_lineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, "r", encoding = "utf8") # archivo pertenece a un tipo de dato que no usamos todavia
    lineas = archivo.readlines()
    res: int = len(lineas)
    archivo.close()
    return res

#2
# voy a usar la funcion split, que transforma una linea de texto en una lista con las palabras que tiene como elementos 
def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo, "r", "utf8")
    texto = archivo.read()
    palabras = texto.split()
    res: bool = False
    if palabra in palabras:
        res = True
    return res 

#3
def cantidad_apariciones(palabra: str, nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, "r", "utf8")
    texto = archivo.read()
    palabras = texto.split()
    res: int = 0
    while palabra in palabras:
        res += 1
        palabras.delete(palabra)
    return res 

#Ejercicio 2
def primer_caracter(s : [str]) -> str:
    res: int = " "
    for i in s:
        if i != " ":
            res: str = i
        break
    else:
        pass
    return res

# podia usar linea.strip() que lo que hace en borrar los espacios del principio y del final. ahi podria ver si # era el primero o no 

def clonar_sin_comentarios(nombre_archivo: str):
    archivo = open(nombre_archivo, "r", encoding = "utf8")
    lineas = archivo.readlines()
    nuevo_archivo = []

    for linea in lineas:
        if primer_caracter(linea) != "#":
            nuevo_archivo.append(linea)

    archivo.close()
    salida = open("sin_comentarios.txt", "w")

    for linea in nuevo_archivo:
        salida.write(linea)

    salida.close()


# Ejercicio 3
def reverso(nombre_archivo: str):
    archivo = open(nombre_archivo, "r", encoding = "utf8")
    lineas = archivo.readlines()
    
    nuevas_lineas = lineas.copy()
    nuevas_lineas.reverse()

    nuevas_lineas[0] += '\n'

    a = nuevas_lineas[len(nuevas_lineas)-1]
    a = a[0:len(a)-1:1] 
    nuevas_lineas[len(nuevas_lineas)-1] = a

    archivo.close()

    nuevo_archivo = open("reverso.txt", "w", encoding = "utf8")
    
    for linea in nuevas_lineas:
        nuevo_archivo.write(linea)

    nuevo_archivo.close()

reverso("prueba.txt")

# Ejercicio 4
def agregar_frase_final(nombre_archivo: str, frase: str):
    archivo = open(nombre_archivo, "r", encoding = "utf8")
    lineas = archivo.readlines()
    lineas.append(frase)
    lineas[len(lineas)-2] += '\n'
    archivo.close()

    modificado = open(nombre_archivo, "w", encoding = "utf8")
    for linea in lineas:
        modificado.write(linea)

    modificado.close()



# Ejercicio 5
def agregar_frase_inicio(nombre_archivo: str, frase: str):
    archivo = open(nombre_archivo, "r", encoding = "utf8")
    lineas = archivo.readlines()
    lineas.reverse()
    lineas.append(frase)
    lineas.reverse()
    lineas[0] += '\n'
    archivo.close()

    modificado = open(nombre_archivo, "w", encoding = "utf8")
    for linea in lineas:
        modificado.write(linea)

    modificado.close()


# Ejercicio 6
def caracter_valido(c: chr) -> bool:
    res: bool = False
    if ('a' <= c <= 'z') or ('A' <= c <= 'Z') or ('0' <= c <= '9') or (c == ' ') or (c == '_'):
        res = True
    return res

def palabras_legibles(nombre_archivo: str) -> [str]:
    archivo = open(nombre_archivo, 'rb')
    texto = archivo.read()
    
    palabra: str = ""
    validas: [str] = []

    for b in texto:
        if caracter_valido(chr(b)): 
            palabra += str(chr(b))

        elif not(caracter_valido(chr(b))) and len(palabra) >= 5: 
            validas.append(palabra)
            palabra = ""

        else: 
            palabra = ""

    return validas


# Ejercicio 7
def promedio_estudiante(lu: str) -> float:
    if lu[-1] != ",":
        lu += ","
    archivo = open("siuguarani.csv", "r", encoding = "utf8")
    lineas = archivo.readlines()
    promedio: float = 0
    notas: [float] = []
    for linea in lineas:
        linea = linea.split()
        print(linea)
        if linea[0] == lu:
            notas.append(float(linea[3]))
    if len(notas) != 0:
        promedio = sum(notas)/len(notas)
    return promedio

# Ejercicio 8
def generar_pila_azar(n: int, desde: int, hasta: int) -> Pila:
    res: Pila = Pila()
    for i in range(0,n,1):
        res.put(rd.randint(desde,hasta))
    return res 

# Ejercicio 9
def len_pila(p: Pila) -> int:
    p1 = copiar_pila(p)
    res: int = 0
    while not(p1.empty()):
        p1.get()
        res += 1
    return res 

# Ejercicio 10
def buscar_maximo(p: [int]) -> int:
    pila: [int] = p.copy()
    res: int = pila.pop()
    for i in range(0,len(pila),1):
        if res < pila[-1]:
            res = pila.pop()
        else:
            pila.pop()
    return res

def buscar_maximo2(p: Pila) -> int:
    p1 = copiar_pila(p)
    res: int = p1.get()
    while not(p1.empty()):
        a = p1.get()
        if res < a:
            res = a
    return res

# Ejercicio 11
def esta_balaceada(s: str) -> bool: 
    p: Pila = Pila()
    res: bool = True
    for i in s: 
        if p.empty() and i == ')':
            res = False
        elif i == '(':
            p.put(1)
        elif i == ')':
            p.get()
    res = p.empty() and res 
    return res 

# Ejercicio 12
def postfix(s: str) -> int: 
    op = ["+", "-", "*", "/"]
    p: Pila = Pila()
    l: [str] = s.split()
    for i in l: 
        if i not in op: 
            p.put(int(i))
            print(i)
        else: 
            if i == '*':
                a = p.get() * p.get()
                p.put(a)
            elif i == '+':
                a = p.get() + p.get()
                p.put(a)
            elif i == '-':
                a = - p.get() + p.get()
                p.put(a)
            else: 
                a = (1 / p.get()) * p.get()
                p.put(a)
    return p.get()

# Ejercicio 13
def generar_cola_azar(n: int, desde: int, hasta: int) -> Cola:
    p: Pila = generar_pila_azar(n, desde, hasta)
    res: Cola = Cola()
    for i in range(0,len_pila(p),1):
        v = p.get()
        res.put(v)
    return res 

# Ejercicio 14 
def len_cola(p: Cola) -> int:
    p1 = copiar_cola(p)
    res: int = 0
    while not(p1.empty()):
        p1.get()
        res += 1
    return res 

# Ejercicio 15
def buscar_maximo_cola(c: Cola) -> int: 
    c1: Cola = copiar_cola(c)
    res: int = c1.get()
    while not(c1.empty()):
        a = c1.get()
        if res < a:
            res = a
    return res 

# Ejercicio 16
# 1
def armar_secuencia_bingo() -> Cola:
    bingo = Cola()
    for i in range(0,99,1):
        bingo.put(rd.randint(0,99))
    return bingo

# 2
def jugar_carton_bingo(carton: [int], bolillero: Cola) -> int:
    b = copiar_cola(bolillero)
    contador: int = 0
    c = carton.copy()
    while c != []:
        a = b.get()
        if a in c:
            c.delete(a)
        contador += 1
    return contador

# Ejercicio 17
def n_urgentes(c: Cola) -> int:
    c1: Cola = copiar_cola(c)
    res: int = 0
    while not(c1.empty()):
        p = c1.get()
        if p[0] <= 3:
            res += 1
    return res 

# Ejercicio 18 
def a_clientes(c: Cola) -> Cola:
    c1: Cola = copiar_cola(c)
    res: Cola = Cola()
    pref: Cola = Cola()
    demas : Cola = Cola()
    while not(c1.empty()):
        a = c1.get()
        if a[3]:
            res.put(a)
        else: 
            pref.put(a)
    while not(pref.empty()):
        a = pref.get()
        if a[2]:
            res.put(a)
        else:
            demas.put(a)
    while not(demas.empty()):
        a = demas.get()
        res.put(a)
    return res 

#Ejercicio 19 
def agrupar_longitud(nombre_archivo: str) -> dict: 
    archivo = open(nombre_archivo, 'r', encoding = 'utf8')
    texto = archivo.read()
    palabras: [str] = texto.split()
    res: dict = {}
    for i in palabras:
        if len(i) in list(res.keys()):
            res[len(i)] += 1
        else: 
            res[len(i)] = 1
    return res 

# Ejercicio 20 
def promedio_notas() -> dict: 
    archivo = open("siuguarani.csv", 'r', encoding = 'utf8')
    lineas = archivo.readlines()
    res: dict = {}
    for linea in lineas:
        linea = linea.split()
        if linea[0] not in list(res.keys()):
            res[linea[0]] = promedio_estudiante(linea[0])
    archivo.close()
    return res 

# Ejercicio 21
def palabra_mas_frecuente(nombre_archivo: str) -> str: 
    archivo = open(nombre_archivo, 'r', encoding = 'utf8')
    texto = archivo.read()
    palabras = texto.split()
    contador : dict = {}
    for p in palabras:
        if p in list(contador.keys()):
            contador[p] += 1
        else: 
            contador[p] = 1 
    a = max(list(contador.values()))
    res: str = list(contador.keys())[list(contador.values()).index(a)]
    return res 
