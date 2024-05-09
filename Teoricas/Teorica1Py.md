# Introduccion de Programacion Imperativa: 
*Algoritmos y programas como ya vimos*

## Programacion imperativa: 
*Los programas no son necesariamente funciones, pueden devolver mas de un valor y hay nuevas formas de pasar argumentos*
*Nuevo concepto de varibales*
*Variables
 *Posiciones de memoria
 *Cambias con la ejecucion del programa
 *Perdida de transparencia referencial 

* **Asignacion:** 
 * Cambiar el valor de una variables

* **Las funciones no pertenecen a un tipo de dato** 

* **Mecanismo de repeticion** 
 * En vez de recursion usamos interacion

* **Nuevo tipo de datos: Arreglos**
 * Secuencia de valores de un tipo
 * Longitud prefijada
 * Acceso directo a una posicion

* **Python:**
    * *Vamos a usarlo para programacion imperativa*
    * *Vamos a usar un subconjunto. No objetos, no memoria dinamica, etc. Si notacion de clases*
    * *Lenguaje interpretado*
    * *Tipado dinamico*
        * *Una variable puede tomar valores de distintos tipos*
        * *Vamos a pensar con tipado estatico, declaramos el tipo de cada variable en tiempo de diseño*
    * *Fuertemente tipado*
        * *Una vez que una variables toma un tipo no puede cambiar*
    * *Coleccion de tipos y funciones*
    * *Definicion de funcion:*  def nombreFuncion (parametros) -> tipoResultado
                                    bloqueInstrucciones
    * *Su evaluacion consiste en ejecutar una por una las instrucciones del bloque*
    * *Siempre se lee de abajo para arriba*

**Dinamico vs Estatico:** 
    * *Tipado dinamico: Una variable puede tomar valores de distintos tipos*
    * *Tipado estatico: La comprobacion de tipificacion se realiza durante la compilacion (no la ejecucion)*
    * Vamos a usar tipado estatico con un fin didactico     

* **Variables en Imperativo** 
    * Nombre asociado a un espacio de memoria 
    * Puede tomar distintos valores a lo largo de la ejecucion
    * En Python se declara con el propio nombre, ej: (x : int)
    * Los valores finales deben resolver el problema 

**Instrucciones:** 
*Asignaciones 
*Condicionales (if, else, etc)
*Ciclos (while, etc)
*Procedimientos (funciones que no devuelven valores pero modifican sus argumentos)
*Retorno de control (con un valor, return)

**Asignacion:**
*Es la operacion para modificar el valor de una variables
    *Sintaxis: *variables = expresion*
*Es una operacion asimetrica
    * Lado izquierdo: debe ir una variable o expresion que represente una posicion de memoria 
    * Lado derecho: expresion del mismo tipo que la variables (constante, variables o funcion aplicada a argumentos)
*La expresion de la derecha es evaluada y se obtiene un valor para la variable
    * Se guarda el valor en el espacio de memoria de la variable, el resto de la memoria no cambia

**Return:** 
* Termina la ejecucion de una funcion 
* Retorna el control a su invocador
* Devuelve el valor de la expresion como resultado 

**Trasformacion de estados:**
* *Estado:* valores de todas sus variables en un punto de su ejecucion 
    * Antes de ejecutar la primera instruccion
    * Entre dos instrucciones
    * Despues de ejecutar la ultima instruccion 
* Vamos a ver la ejecucion de un programa como *sucesion de estados*
* La asignacion es la instruccion que transforma estados
* El resto de las instrucciones son de control, modifican el flujo de ejecucion 

* Cada instruccion define un nuevo estado 
* A cada estado se le puede dar un nombre, que presentara el conjunto de valores de las variables entre dos instrucciones:
*instruccion* 
*// estados nombre_estado* 
*otra instruccion* 

Para referirnos al valor de una variables en ese estado:
*nombre_variable@nombre_estado*

def suc(x: int) -> int:
        //estado a;
    x = x + 2
        //estado b
        //vale x == x@a+2;
        *En el estado b, x vale lo que valia en el estado a mas 2*
    x = x - 1
        //estado c
        //vale x == x@b-1;
        *En el estado c, x vale lo que valia en el estado b menos 1*
    return x

*Esto es una ejecucion simbolica del programa declarando cuanto vale cada variable en cada estado del programa*
*Algunas tecnicas de verificacion estatica utilizan estos recursos*

**Argumentos de entrada:**
*Para indicar que una funcion recibe argumentos de entrada usamos variables, que toman valor cuando se invoca a la funcion*
* *Dos tipos de pasajes (en imperativo):*
    * *Pasaje por valor:* se crea una copia local de la variable dentro de la funcion, tambien se llama por copia
    * *Pasaje por referencia:* se maneja directamente la variable, los cambios dentro de la funcion tambien afectan por fuera
        * Por referencia queda modificada la memoria y cambia el valor de la variable EN LA MEMORIA (para esta funcion y cualquier otra)
        * La funcion puede leer y modificar esa posicion de memoria
        * Tiene riesgos y beneficios 
        * Los argumentos por referencia sirven para dar resultados de salida (o de entrada y salida)
        * La expresion debe ser una variable que tenga asociada una posicion de memoria
        * No puede ser constante ni una funcion aplicada 

**Valor y referencia**

| | 1 | 2 | 3 | 4 | 5 |
| - | - | - | - | - | - |
|A | | | | | |
|B | | | | 5 | |
|C | | | | | |
|D | 25| | | | |
|E | | | 13| | |

||valor|referencia|
|-|-|-|
|x|5|B4|
|y|25|D1|
|z|13|E3|

* **Funciones y procedimientos:** *ambos ejecutan un grupo de sentencias*
    * Funciones: devuelve un valor 
    * Procedimiento: no devuelve un valor

* **Pasajes de parametros:** 
    * *Entrada (in):* la variable pasada como parametro continuara teniendo su valor original. "Lo leo y no lo modificio"
    * *Salida (out):* la variable pasada como parametro tendra un nuevo valor asignado dentro de dicha funcion/procedimiento
        * El valor inicial NO importa ni deberia ser leido en la funcion/procedimiento. "No lo leo y lo modifico"
    * *Entrada y salida (inout):* la variable pasada como parametro tendra un nuevo valor asignado dentro de dicha funcion/procedimiento
        * El valor inicial SI importa, deberia ser leido en la funcion/procedimiento. "Lo leo y lo modifico"

problema nombre(parametros) : tipo de dato del resultado *(opcional)* {
    requiere etiqueta: { condiciones sobre los par´ametros de entrada }
    *modifica: parametros que se modificaran*
    asegura etiqueta: { condiciones sobre los par´ametros de salida }
*Si x es un parametro inout, x@pre se refiere al valor que tenia x al entrar a la funcion* 
}

* *Parametros:*
    * *Tipo de pasaje (in, out, inout)*
* *Tipo de dato del resultado:*
    * *Se vuelve opcional porque no necesariamente devuelve un valor*

* **Pasaje de argumentos en Python:**
    * *Depende del tipo de datos de las variables*
        * *Tipos primitivos:* Se pasan por valor
        * *Tipos compuestos:* Se pasan por referencia
    * *Todos los parametros son por referencia en realidad, pero los tipos primitivos tienen referencias a valor inmutables*

**Mucho cuidado cuando una especificacion pide in, out o inout. Todo es mucho mas finito**

 #estado a
v = e;
 #vale v == e@a, z1 == z1@a, ...
*Donde zi son todas las variables del programa en cuestion distintas a v que estan definidas hasta ahi*

Si la expresion e es la invocacion a una funcion que recibe parametros por referencia, puede haber mas cambios, pero podemos asegurar:
 #vale v == e@a 

* **Identacion:** 
    * *Es la sangria o tabulacion*
    * *Me define donde hay un bloque de instrucciones*
    * *En otros lenguajes se usan {}*

**Alcance, ambito o scope:**
*Alcance:* ambito o espacio donde una variable es reconocible
*Una variable local solo sera valida dentro del bloque (funcion/procedimiento) donde fue declarada. Cuando se termina se destruye la variable*
*Una varible global es declarada fuera de todo bloque y cualquier bloque puede acceder a ella*
    * *Para modificar una variable global en un bloque tengo que usar la referencia "global"*

*El termino global o local depende del lenguaje, en Python mismo con una variable llamada dentro de un IF o WHILE puedo usarla*
*El bloque minimo es a nivel funcion, los bloques dentro de un IF o WHILE estan dentro del anterior*

**Python distingue 4 tipos de visibilidad**
*Local:* corresponde al ambito de una funcion
*No local (enclosed):* no esta en el ambito local, pero aparece en una funcion dentro de otra funcion
*Global:* declarada en el cuerpo principal del programa, fuera de cualquier funcion
*Integrado (built-in):* Son declaraciones de Python (def, print, etc)

*Al pasar un parametro por referencia, esta referencia vivira dentro del scope de la funcion*

**Condicionales:**

if (B): ----> B es una condicion booleana
    uno
else: 
    dos

**Ciclos:**

*While:* Tiene una condicion, mientras se cumpla la condicion sigue las instrucciones, cuando no se cumple sigue con el resto
*Do while:*: Lo mismo que el anterior pero primero aplica las intrucciones y despues la condicion
*For:* Tiene una inicializacion que me dice cuanto se va a repetir, si la condicion es verdadera pasa a instrucciones y actualiza, sino sigue

**for i in range (i,f,p) ---> i: Inicial de la lista, f: Final de la lista, p: Paso de recorrido**

**Break:** *Nos permite cortar un ciclo en un determinado momento si se da cierta condicion*

Pasar a archivo .py:

while(True):
    numero = int(input("Decime un numero"))
    print("Numero seleccionado:" numero)
    if (numero == 0):
        break

print("Fin del programa")