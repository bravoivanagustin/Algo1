# Especificacion, elementos y funciones: 

## Especificacion: describe un problema, no dice COMO lo vamos a resolver pero si QUE tenemos que resolver
*Vamos a usar un lenguaje de especificacion semiformal basado en:* 

    | problema nombre(parametros) : tipo de dato de resultado {
    |   requiere etiqueta: {condiciones de entrada del problema}
    |   aseguera etiqueta: {condiciones de salida del problema}
    | }

**Requiere:** *Describe condiciones y valores posibles o casuistucas de los parametros de entrada, evitar contradicciones*

**Asegura:** *Describe condiciones y valores posibles o casuistucas de los parametros de salida, evitar contradicciones*

**La especificacion y el programa van a ser parte de un contrato entre programador y usuario. Ambos tienen que cumplir con su parte del contrato.** 
*Los datos de entrada y salida tienen que ser los que se acordaron en el contrato.*
* *Por esto es importante la especificacion y para eso debemos evitar sobre o sub especificar.* 
    * *Sobre especificar* 
        * Postcondicion mas resctrictiva y/o precondicion mas laxa
        * Problemas para el programador
        * Limita los posibles algoritmos

    * *Sub especificar:*   
        * Postcondicion mas libre y/o precondicion mas resctrictiva
        * Problemas para el usuario
        * Pueden haber algoritmos que no cumplan

**Elementos:** 

* *Vamos a usar logica ternaria, esta toda la teoria y ejercicios en mi cuaderno de la materia.*

* **Tipos de datos: Conjunto de parametro y funciones**
        * Enteros(Z)
        * Reales(R)
        * Characters(Char)
        * Booleanos(B o Bool)
        * Enumerados

* **Uplas: Estructura de datos para organizar informacion, puede tener distintos tipo de datos** 
    * *T1 x T2 x T3 ... x Tn : tiene n tipos de datos (pueden repetirse) y elementos, n es fijo* 
    * *Indexacion: (a0, a1, ... , an)m con (0 < m < n) es el termino de indice m = am* 
    * *Son pares ordenados (3,4)!=(4,3)*

* **Secuencias: Estructura de datos que es un conjunto de datos, pero en el cual puede variar la cantidad de elementos**
    * *seq⟨T⟩ es una secuencia con elementos de tipo T, todos pertenecen al mismo tipo de datos*
    * *⟨⟩ es la secuencia vacia y su tipo de datos depende del contexto* 
    * *Tambien son pares ordenados ⟨3,4⟩!=⟨4,3⟩*
    * *seq⟨seq⟨T⟩⟩ es una secuencia de secuencias --> ⟨⟨1,2⟩ , ⟨⟩ , ⟨0,9,0⟩⟩*


* **Funciones sobre secuencias: (a:seq⟨T⟩, b:seq⟨T⟩, x:T, t:T, i:Z, h:Z, d:Z)**

    * lenght(a) : Z := largo de la secuencia a  

    * a[i] : T := elemento ai de la secuencia a

    * pertence(x,a) : Bool 
        * true sii x es un elemento de la lista a
        * pertece(x,a) == x є a

    * Igualdad (a = b) : Bool 
        * true sii |a| = |b| y a[i]= b[i] (para todo 0 < i < lenght(a)-1)

    * head(a) : T := devuelve el primer elemento de la lista
        * head(a) = a[0]

    * tail(a) : seq⟨T⟩ := devuelve la secuencia sin el primer elemento

    * concat(a,b) : seq⟨T⟩ := devuelve la secuencia a seguida por b
        * concat(a,b) = a++b
        
    * addFirst(t,a) : seq⟨T⟩ := devuelve la lista a agregando t como primer elemento 
        * addFirst(t,a) == [t]++a

    * subseq(a,d,h) : seq⟨T⟩ := devuelve una sublista de a desde la posicion d (inclusive) hasta la posicion h (excluyente)
        * 0<=d<=h<=|a| es un requerimiento, sino se indefine
        * si d=h devuelve la secuencia vacia

    * setAt(a,i,t) : seq⟨T⟩ := devuelve a pero reemplaza ai por t
        0<=i<=|a|-1

* **Modularizar:**
    * Transformar problemas grandes en varios mas pequeños. Resolver estos primero y despues recomponer para obtener solucion total
    * Es mas facil probar o testear soluciones mas pequeñas 

* **Algoritmos:** 
    * Como resolver una especificacion/problema mediante un programa que sigue pasos automaticos
    * Varios programas pueden implementar un mismo algoritmo
    * En Haskell un programa va a ser una coleccion de funciones -> (Funciones + Mecanismo de reduccion) = Algoritmo 
        * Siempre lee de izquierda (funcion a definir) a derecha (expresion de la funcion)


* **Sobre Haskell:** 

    * Transparencia referencial:
        * El valor de una expresion depende exclusivamente de sus subexpresiones, sin importar el contexto del programa

    * Expresiones atomica: irreducibles y mas simples (Ej: 2, true, 'a')

    * Expresiones compuestas: reducibles, mezclan expresiones atomica y operaciones (Ej: 1+1, true!!false, 'a'++'')
    
    * Hay que mantener ciertas reglas sintacticas y no mezclar operaciones entre distintos tipos de datos.

    * Haskell es fuertemente tipeado ---> Cada expresion pertenece a un solo tipo de datos

    * Funciones prefijas e infijas: 

        resta x y = x - y
            ^         ^
        prefija    infija     

    * Haskell es un lenguaje lazy, resuelve de afuera para adentro, intenta no llegar a los parametros irreducibles de una expresion

    * Funciones totales: No se indefinen nunca por la forma que tienen (f n = 2*n)

    * Funciones parciales: Por su forma pueden indefinirse (f n = 1/n)

    * Signatura: Que tipos de datos toma la funcion y cual devuelve
        funcion :: T1 -> T2 -> ... -> Tn 