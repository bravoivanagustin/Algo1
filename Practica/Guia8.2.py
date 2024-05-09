from queue import LifoQueue as Pila

historiales = {}
borrados = {}

def visitar_sitio(historiales: dict, usuario: str, sitio: str):
    if usuario in list(historiales.keys()):
        historiales[usuario].put(sitio)
    else: 
        historiales[usuario] = Pila()
        historiales[usuario].put(sitio)

def navegar_atras(historiales: dict, usuario: str):
    global borrados
    a = historiales[usuario].get()
    if usuario in list(borrados.keys()):
        borrados[usuario].put(a)
    else:
        borrados[usuario] = Pila()
        borrados[usuario].put(a)

def navegar_adelante(historiales: dict, usuario: str):
    global borrados
    a = borrados[usuario].get()
    historiales.put(a)

inventario = {}

def agregar_producto(inventario: dict, nombre: str, precio: float, cantidad: int):
    inventario[nombre] = {"Precio": precio, "Cantidad": cantidad}

def actualizar_stock(inventario: dict, nombre: str, cantidad: int):
    inventario[nombre]["Cantidad"] = cantidad

def actualizar_precios(inventario: dict, nombre: str, precio: float):
    inventario[nombre]["Precio"] = precio

def calcular_valor_inventario(inventario: dict) -> float:
    res: float = 0
    for i in list(inventario.values()):
        res += i["Cantidad"] * i["Precio"]
    return res 
