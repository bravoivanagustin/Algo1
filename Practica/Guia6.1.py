import math as m
# Guia 6. Python

#Ejercicio 1
#1
def imprimir_hola_mundo():
    print("Hola mundo!")

#2
def imprimir_un_verso():
    print("La llaman salvaje \nCuando la turra se aprieta, se toca, se sube el traje \nTiene a los turro' volviendose locos, siguiendo su baile \nEh-eh, Eh-eh" )

#3
def raizDe2():
    print(round(m.sqrt(2),4))

#4
def factorial_2() -> int:
    return m.factorial(2)

#5
def perimetro() -> float:
    return 2*m.pi

#Ejercicio 2
#1
def imprimir_saludo(nombre: str): 
    print("Hola %s" %nombre)

#2
def raizCuadrada(num: float) -> float:
    return m.sqrt(float(num))

#3
def farenheit_a_celsius(t:float) -> float:
    tCelsius: float = ((t-32)*5)/9
    return tCelsius


#4
def imprimir_dos_veces(estribillo: str) -> str:
    duplicado: str = estribillo*2
    return duplicado

#5
def es_multiplo_de(n:int, m:int) -> bool:
    res: bool = n/m == int(n/m) #n%m es como hace n mod(m)
    return res

#6
def es_par(numero: int) -> bool:
    res: bool = numero%2 == 0 
    return res

#7
def cant_pizzas(comensales: int, min_porc: int) -> int:
    pizzas = (comensales * min_porc)/8
    if pizzas == int(pizzas):
        res: int = pizzas
    else:
        res: int = int(pizzas) + 1

#Ejercicio 3

#1
def alguno_es_0(num1:float, num2:float) -> bool:
    res:bool = (num1 == 0 or num2 == 0)
    return res

#2
def ambos_son_0(num1:float, num2:float) -> bool:
    res:bool = (num1 == 0 and num2 == 0)
    return res

#3
def longitud(algo): #ya existe len, pero me pinto hacer longitud
    contador = 0
    for i in algo:
        contador += 1
    return contador

def es_nombre_largo(nombre: str) -> bool:
    res:bool = (3 <= longitud(nombre) and longitud(nombre) <= 8)
    return res


#4
def es_bisiesto(año:int) -> bool:
    res:bool = año%400==0 or (año%4==0 and año%100!=0)
    return res

#Ejercicio 4
#1
def peso_pino(largo_p:float) -> float:
    if largo_p <= 3:
        res:float = 300 * largo_p
    else:
        res:float = 900 + 200 * (largo_p-3)
    return res
#print(peso_pino(2))
#print(peso_pino(5))

#2
def es_peso_util(peso_p:float) -> bool:
    res = (400 <= peso_p <= 1000)
    return res
#print(es_peso_util(500))
#print(es_peso_util(5040))

#3 y 4
def sirve_pino (largo_p:float) -> bool:
    res = es_peso_util(peso_pino(largo_p))
    return res
#print(sirve_pino(5))
#print(sirve_pino(2))

#Ejercicio 5
#1
def devolver_el_doble_si_es_par(un_numero:int) -> int:
    res:int = un_numero     #esta estructura es muy util, a veces me conviene tenerlo definido antes
    if un_numero%2 == 0:
        res = 2*un_numero
    return res

#2
def devolver_valor_si_es_par_sino_el_que_sigue(un_numero:int) -> int:
    res:int = un_numero
    if un_numero%2 != 0:
        res = un_numero + 1
    return res

#3
def devolver_el_doble_o_triple(un_numero:int) -> int:
    res:int = un_numero
    if un_numero%3 == 0:
        res = 2*un_numero
    if un_numero%9 == 0:
        res = 3*un_numero
    return res

#4 
def lindo_nombre(nombre:str) -> str:
    res:str = "Que lindo nombre"
    if longitud(nombre) >= 5:
        res = "Tu nombre tiene muchas letras"
    return res

#5
def elRango(numero:float) -> str:
    res:str = "Menor a 5"
    if 10<=numero<=20:
        res = "Esta entre 10 y 20"
    if numero<20:
        res = "Mayor a 20"
    return res

#6
def trabajo_vacaciones(sexo:str, edad:int) -> str:
    varones:bool = sexo == "M" and (18 < edad < 65)
    mujeres:bool = sexo == "F" and (18 < edad < 60)
    res: str = "Anda de vacaciones"
    if varones or mujeres:
        res = "Te toca trabajar"

#Ejercicio 6
#1
def contar_hasta_10():
    i = 1
    while i <= 10:
        print(i)
        i += 1

#2
def contar_pares():
    i = 10
    while i <= 40:
        print(i)
        i += 2

#3
def repetir_eco():
    i = 1
    while i <= 10:
        print("eco")
        i += 1

#4
def cuenta_regresiva(t:int) -> str:
    while t >= 1:
        print(t)
        t -= 1
    print("Despegar")

#5
def viaje_en_tiempo(s:int, l:int) -> str:
    while l!=s:
        s -= 1
        print("Viajo al año pasado, estamos en el año %d" %s)

#6
def viaje_en_tiempo2(s:int) -> str:
    while s >= -364:
        s -= 20
        print ("Viajamos al año %d" %s)

#Ejercicio 7
#1
def contar_hasta_10_2():
    for i in range(1,11,1):
        print(i)

#2
def contar_pares_2():
    for i in range(10,41,2):
        print(i)

#3
def contar_hasta_10_2():
    for i in range(1,11,1):
        print("eco")

#4
def cuenta_regresiva(t:int) -> str:
    for i in range(t,0,-1):
        print(i)
    print("Despegar")

#5
def viaje_en_tiempo_2(s:int, t:int):
    for i in range(s,t,-1):
        print("Viajo al año pasado, estamos en el año %d" %(i-1))

#6 
def viaje_en_tiempo2_2(s:int):
    for i in range(s,-384,-20):
        print("Viajo al año %d" %i)

#pass es una funcion que dado un if o else, etc. le dice que no haga nada
