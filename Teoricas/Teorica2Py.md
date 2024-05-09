# Arrays y listas

* Nota: Buscar tipado dinamico y estatico

* **Variables en imperativo:**
    * *Nombre asociado a un espacio de memoria*
    * *Puede tomar distintos valores durante la ejecucion*
    * *En Python se declara dando su nombre (opcionalmente el tipo)*
    * *Programacion imperativa:*
        * Conjunto de variable 
        * Instrucciones que van cambiando sus valores
        * Los valores finales deberian resolver el problema

* **Arrays (arreglos):**
    * *Secuencia de una cantidad fija de valores del mismo tipo*
    * *Se declaran con nombre y tipo, en Python tienen longitud variables*
    * *Solamente hay valores en las posiciones validas*
    * *Una sola variable contiene muchos valores:*
        * A cada valor se puede acceder por mediante de corchetes
        * a[0] es el primer elemento de a, a[5] el sexto

*Los arrays se pasan por referencia SIEMPRE*
*Memoria*
| |1|2|3|4|5|
| |-|-|-|-|-|
|a| | | | | |
|b|5|6|7|8| | 
|c| | | | | | 
|d| | | | | |

*Varibles*
|Nombre|Tipo|Tamaño|Valor|Referencia|
|-|-|-|-|-|
|a|Array de int|4|[5,6,7,8]|B1|

* **Listas:**
    * *Ambas representan secuencias de elementos de un tipo*
    * *Las listas tienen longitud variable*
    * *Los elementos de la lista se acceden secuencialmente*
    * *Para obtener el i-esimo elemento hay que obtener i veces la cola y despues la cabeza*
    
*Podemos usar arreglos con los modulos array y NumPy*
*Se indicar su tipo "array", y su contenido*

from array import *
a: array = array(typecode, [inicializers])

Ej: a: array = array('i', [10,20,30]) i de int

|Code Type|Python Type|Full Form|Tamaño(Bytes)|
|-|-|-|-|
|u|unicode character|Python Unicode|2|
|b|int|Signed Char|1|
|B|int|Unsigned Char|1|
|h|int|Signed Short|2
|l|int|Signed Long|4|
|L|int|Unsigned Long|4|
|q|int|Signed Long Long|8|
|Q|int|Unsigned Long Long|8|
|H|int|Unsigned Short|2|
|f|float|Float|4|
|d|float|Double|8|
|i|int|Signed Int|2|
|I|int|Unsigned Int|2|

* **Operaciones Basicas sobre Arrays y Listas:**
    * a[i] -> Obtiene valor del elemento i de a
    * a[i] = x -> Asigna x en el elemento i de a
    * a.append(x) -> Añade x como nuevo elemento de a, al final
    * a.remove(x) -> Elimina el primer elemento en a que coincida con x
    * a.inden(x) -> Obtiene la posicion donde x aparece por primera vez
    * a.count(x) -> Devuelve la cantidad de apariciones del elemento x en a
    * a.insert(p,x) -> inserta el elemento x delante de la posicion p 

*En Python, las listas son un tipo de array, y pueden tener elementos de diferentes tipos de datos y tienen tamaño dinamico*

*Un ejemplo de una operacion que tiene el array y no la lista: Buffer Info devuelve una tupla con direccion de memoria actual de los arrays y numero de elementos*

*Variable iteradora es una que creo de manera que recorra una lista o un array*

**Las matrices se pueden representar como un array de arrays (o listas de listas)**
Probar hacer esto y ver que manera me resulta mas facil/comoda

* **Tipo abstracto de Datos (TAD):**
    * *Es un modelo que define valores y operaciones que se pueden hacer sobre ellos*
    * *Se llama abstracto porque quien los usa no necesita conocer los detalles de la representacion interna o como se definen las funciones*
    * *El tipo lista que vimos es un TAD:*
        * Serie de elementos consecutivos
        * Diferentes operaciones asociadas
        * No sabemos como se usa/guarda la informacion almacenada

* **Pila:**
    * *Es una lista de elementos de la cual se puede extraer el ultimo elemento insertado*
    * *Listas LIFO*
    * *Operaciones:*
        * apilar: ingresa un elemento -> a.append(x)
        * desapilar: saca el ultimo elemento agregado -> a.pop()
        * tope: devuelve el ultimo elemento agregado -> a[-1]
        * vacia: devuelve True si es vacia -> len(a) == 0 
    
* **Cola:**
    * *Es una lista de elementos de la cual se puede extraer el primer elemento insertado y se agregan elementos al final*
    * *Listas FIFO*
    * *Operaciones:*
        * encolar: ingresa un elemento -> a.append(x)
        * sacar: saca el primer elemento agregado -> a.pop(0)
        * vacia: devuelve True si es vacia -> len(a) == 0
        