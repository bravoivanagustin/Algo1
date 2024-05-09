class Persona: 
    def __init__(self, nombre: str, edad: int): # se pueden usar parametros por defecto por ej nombre: str = "Pablo"
        self.nombre = nombre                    # si no se pone ese atributo directamente se asigna Pablo
        self.edad = edad
    
    def presentarse(self): # es una funcion creada en un entorno "local" de la clase Persona
        print(f"Hola, mi nombre es {self.nombre} y mi edad es {self.edad}")
    
persona1 = Persona("Juan", 25)
print(persona1.nombre)
print(persona1.edad)
persona1.edad = 20 # asigna 20 al atributo edad del objeto persona1
persona1.presentarse() # se usa el self de manera implicita, ya se sabe que self en este caso es persona1, entonces llama
Persona.presentarse(persona1) # aca el self directamente se identifica como persona1, pero es lo mismo que el anterior