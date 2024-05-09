Polimorfismo:
    -Funcion que se puede aplicar a distintos tipo de datos 
    -Se usa cuando el comportamiento de la funcion no depende parametricamente del tipo de sus argumentos
    -Funciones genericas (en lenguaje de especificacion)
    -Se escriben usando variables de tipo y conviven con el tipado fuerte
    -Ej: funcion identidad
    (Ya use esto, pero no sabia si estaba bien)

Variables de tipo:
    -Parametro que se escriben en la signatura usando variables minusculas
    -Denotan tipos
    -Se usa como argumento el tipo del valor

    Ej: primero :: tx -> ty -> tx 
        primero x y = x     
                ^
    usa el tipo de dato de x como resultado

Clases de tipo:
    -Una clase de tipo es un conjunto de tipo y un conjunto de funciones. A los tipos se le tiene que podes aplicar estas funciones
    -Me sirve para restringir los tipos de variables que puede tomar un parametro dentro de una funcion 

    Ej: suma :: (Num t) => t -> t -> t 
        suma x y = x + y
    >En este caso nos sirve para restringir el tipo a los numerables (donde esta definida la suma)


    1. Integral := ({ Int, Integer, ... }, { mod, div, ... }) ---> Enteros

    2. Fractional := ({ Float, Double, ... }, { (/), ... }) ---> Racionales

    3. Floating := ({ Float, Double, ... }, {sqrt, sin, cos, tan, ... }) ---> Reales

    4. Num := ({ Int, Integer, Float, Double, ... }, {(+), (*), abs, ... }) ---> Operaciones aritmeticas comunes a integral, fractional y floating

    5. Ord := ({Bool, Int, Integer, Float, Double, ... }, {(<=), compare }) ---> Comparabales por orden

    6. Eq := ({ Bool, Int, Integer, Float, Double, ... }, { (==), (/=)}) ---> Comparables por igualdad

OBS : Int tiene un maximo y un minimo bastante acotado, me salto un error y no sabia porque.
      Integer tiene tambien pero es muchisimo mas extenso, tarda mas en correr. 
      Algo parecido pasa con Float y Double (double es mas preciso, pero mas pesado)

Funciones importantes: fromIntegral(x) ---> Toma un x Int y lo pasa a Float
                       truncate(x) o round(x) ----> Toma x Float y lo pasa a Int 

cantidadSoluciones :: (Num t, Ord t) ---> Hace pertenecer t a la clase de tipo Num y Ord

OBS : a**b requiere a,b Floating, a^b puede usar Num

Tuplas, son una clase de tipo. 
    Dados tipo A1, A2, ..., Ak el tipo k-upla es (A1, A2, ..., Ak) es el conjunto de las k-uplas (v1, v2, ..., vk) donde vi es de tipo Ai 
    En haskell hay infinito tipo de Tuplas

    Ejemplo:
    suma :: (Float,Float) -> (Float,Float) -> (Float, Float)
    suma v w = ((fst v) + (fst w), (snd v) + (snd w))

Pattern matching: Correspondencia de patrones. Accede directamente a los parametros en funcion de como esta definida la funcion. 

suma (vx, vy) (wx, wy) = (vx + wx, vy + wy) 

Que me conviene usar? Una dupla, o dos parametros?

Currificacion: Desde un punto de vista practico y teorico tiene mucha mas fuerza usar parametros sueltos que tuplas
               Se llama Currificacion a usar f :: T1 -> T2 -> ... -> Tn en vez de f :: (T1,T2,..., Tn-1) -> Tn

    Practico: tengo que usar muchos menos parentesis y comas para escribir algo 

    Teorico: puedo plantear una funcion adentro de una misma. Para entender:

suma :: Int -> Int -> Int
suma x y = x + y 

Entonces puedo definir suma :: Int -> (Int -> Int) le doy un valor entero a suma y me crea una funcion que dado un entero me da otro

(suma 2) x = 2 + x ---> Muchisimo poder teorico 

Notacion prefija vs infija:
    Prefija: suma x y , (+) x y 
    Infija: x + y 
    El nombre de una funcion & es (&)

Recursividad: Definir una funcion por si misma. Yendo a un caso base, no puedo irme a infinito

factorial :: Int -> Int 
factorial n | n == 0 = 1
            | n > 0 = n*factorial(n-1)

    -Suponemos poder obtener el caso anterior y con eso ir para atras con cada elemento
    -Identificar casos bases y poder alcanzarlos
    -Puede tener uno o mas casos bases, tales que los casos bases no tienen paso recursivo

Generalizacion de funciones: 
    Usar una funcion mas grande para usar funciones mas chicas dentro de ellas pero mas dificil de resolver como unicas
