# Tipos Abstractos de Datos y Testing de Caja Blanca
**Tipos Abstractos de Datos (TAD's):**
*Modelo que define valores y las operaciones que se pueden realizar sobre ellos*
*La idea es que quien lo utilice no necesita conocer los detalles de la representacion interna o como estan implementadas las operaciones*
*El tipo lista es un TAD*
*Ya vimos en la clase anterior las pilas y las colas*
* *Para crea una cola se puede usar la libreria queue: Queue*
    * En esta libreria tenemos las funciones: put, get, empty
    * put es parar ingresa un elemento a la cola (encolar)
    * get es para devolver y quitar el primer elemento insertado (sacar)
    * empty devuelve true si es vacia (vacia)
* *Para crear una pila se puede usar la libreria queue: LifoQueue*
    * Tiene las mismas funciones que la anterior pero la funcion get es para devolver o quitar el ultimo elemento 

**Diccionario:**
*Es una estructura de datos/coleccion de objetos que estan relacionados de a pares "clave:valor"*
*Las claves deben ser de un tipo de dato inmutable (cadenas de textos, numeros, etc) y las claves pueden ser de cualquier tipo de dato*
*La clave actua como identificador unico para obtener su valor correspondiente*
*Los diccionarios son mutables, se pueden agregar, eliminar o actualizar elementos*
*No tienen orden especifico, no se garantiza que se mantenfa el orden de insercion*
*diccionario = clave1:valor2, clave2:valor2, clave3:valor3*
* *Operaciones:*
    * Agregar par
    * Eliminar un elemento
    * Modificar el valor de un par
    * Verificar si existe una clave
    * Obtener todas las claves
    * Obtener todos los elementos
*Buscar acerca de arbol binario de busqueda*

**Manejo de archivos:**
*El manejo de archivos puede pensarse mediante la abtraccion que no briandan los TAD's*
*Necesitamos operaciones que nos permitan abrir, leer y cerrar el archivo*
* *archivo = open("PATH AL ARCHIVO",MODO,ENCODING)*
    * Path es el camino al archivo
    * Modo es de que manera lo quiero recibir, escritura (w), reading (r), texto(t)
    * El Encoding se refiere a como esta codificado: UTF-8 o ASCII son los mas comunes
*contendio = archivo.read()*
*archivo.close()*
* **Operaciones basicas:**
    * *Lectura*
    * read(size): lee y devuelve una cantidad de caracteres o bytes del archivo, si no se especfica se lee el contenido completo
    * readline(): lee y devuelve la siguiente linea del archivo
    * readlines(): lee todas las lineas del archivo y las devuelve como lista
    * *Escritura*
    * write(texto): escribe el texto en la archivo, en la posicion del puntero
    * writelines(lineas): escribe una lista de lineas en el archivo

problema invertirTexto(in archivoOrigen: string, in archivoDestino:string) : {
    requiere: {El archivo nombreArchivo debe existir.}
    asegura: {Se crea un archivo llamado archivoDestino cuyo contenido sera el resultado de hacer un reverse en cada una de sus filas}
    asegura: {Si el archivo archivoDestino existia, se borrara todo su contenido anterior}
}

def invertirTexto(archivoOrigen: str, archivoDestino: str):
    contenido = []
    archivo = open(archivoOrigen, "r", encoding='utf8')
    
    for linea in archivo.readlines():
        contenido.insert(0, linea)
    
    archivo.close()

    destino = open(archivoDestino, "w", encoding='utf8')
    destino.truncate()

    for linea in contenido:
        linea = linea[::-1] --> inverte una cadena de str
        destino.write(linea)
    
    destino.close()

archivoOrigen = ''
archivoDestino = ''
invertirTexto(archivoOrigen, archivoDestino)

* **Testing de Caja Blanca**
    * *Los datos de test se derivan a partir de la estructura interna del programa*
    * *Puedo ver si entra o no a un IF, o si entra o no a un ciclo, etc*
    * *La dificultad radica en averiguar cuales son los resultados esperados*
    * *Por este motivo el test de caja blanca se usa como complemento de test de caja negra o como criterio de adecuacion del test de caja negra*
    * *Nos ayuda a determinar cuan bueno o confiables resultaron ser los test suite definidos*

* **Control Graph Flow:**
    * *Representacion grafica del programa*
    * *No depende de las entradas*
    * *Se usa para definir criterios de adecuacion para test suites*
    * *Cuanto mas partes son ejercitadas, mayores son las chances de un test de descubrir una falla*
    * *Las partes pueden ser nodos, arcos, caminas, decisiones, etc*

**Criterio de Adecuacion:**

*Cubrimiento de Sentencias*
*Todas las sentencias deben ser ejecutadas*
*Cada nodo deberia ser ejecutado al menos una vez por un test case*
*Cobertura = cant nodo ejecutados/nodos totales*

*Cubrimiento de Arcos*
*Todos los arcos deben ser ejecutadas*
*Tambien se puede aplicar lo mismo para los arcos/aristas*
*Es pasar por todos las "flechas"*

*Cubrimiento de Decisiones*
*Todas las decisiones deben ser ejecutadas*
*Debe haber al menos un caso de test que ejercite los arcos de True y False que aparezcan*

*Cubrimiento de Condiciones Basica*
*Una condicion basica es una formula atomica que componen una decision*
*Todas las condiciones basicas de cada decision debe ser evaluada a verdadero y falso al menos una vez*
*Cobertura: cant de valores evaluados en cada condicion/2 x cantidad condiciones basicas*

*Cubrimiento de Caminos*
*Todos los caminos deben ser transitados por al menos un test case*
*Cobertura: cantidad caminos transitados/cantidad total de caminos*
