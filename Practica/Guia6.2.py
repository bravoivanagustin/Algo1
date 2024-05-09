#Sigue Guia 6. Python
#Ejercicio 8

#1
# x = 5
# y = 7
    # x@a = 5
    # y@a = 7
# x = x + y
    # x@b = 12
    # y@b = 7

#2  
# x = 5
# y = 7
# z = x + y 
    # x@a = 5
    # y@a = 7
    # z@a = 12 
# y = x * 2
    # y@b = 10
    # x@b = 5 

#3
# x = 5
# y = 7
    # x@a = 5
    # y@a = 7
# x = "hora"
# y = x * 2
    # x@b = "hora"
    # y@b = "horahora"

#4 
# x = False
# res = not(x)
    # x@a = False
    # res@a = True

#5
# x = True
# y = False
# res = x and y
    # x@a = True
    # y@a = False
    # res@a = False
# x = res and x
    # x@b = False
    # y@b = False
    # res@b = False

#Ejercicio 9

def rt(x: int, g: int) -> int:
    g = g + 1
        #g@a = g@i + 1
    return x + g

g: int = 0

def ro(x: int) -> int:
    global g
    g = g + 1
        #g@a = g@g + 1
    return x + g

# problema rt{in x:Z,in g:Z}: Z {
#   requiere: {True}
#   asegura: {res = x + 2}
# }

# problema ro{in x:Z}: Z {
#   requiere: {True}
#   asegura: {res = x + 1 + cantidad de veces que ro fue ejecutada previamente}
# }

# Cuando establesco GLOBAL cambia la variable definida en el codigo sin importar de que tipo de dato es
# Si no lo establesco pero aplico la funcion de x por ej, cambia dependiendo del tipo de dato al que pertenezca 
