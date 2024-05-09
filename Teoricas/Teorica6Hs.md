Testing:

Requisitos -> Especificacion (contrato) -> Diseño -> Implementacion
    -La especificacion deberia poder ser VALIDADA contra el problema real 
    -El diseño deberia poder ser VERIFICADO con respecto a la especificacion 
    -El programa deberia poder ser VERIFICADO respecto a la especificacion y el diseño

En el contexto de la ingenieria de software, verificacion y validacion (V&V) es
el proceso de comprobar que un sistema de software cumple con sus
especificaciones y que cumple su proposito previsto. Tambien puede ser
denominado como el control de la calidad del software

Validacion: El software hace lo que el usuario quiere?
Verificacion: El software hace lo que dice la especificacion?

Falla: diferencia entre resultados esperados y reales

Defectos: desperfecto en algun componente del sistema 

Error (Bug): Equivocacion humana
-Un error -> Cero, uno o varios defectos -> Cero, una o varias fallas  

V&V deberia aplicarse en cada instancia del proceso de desarrollo: 
    Todos los subproductos generados durante el desarrollo debe ser testeado

Metas: 
    V&V deberia ser suficiente para establecer la confianza de que es adecuado el software
    No nos asegura que este libre de defectos, solo que es suficientemente bueno para el contexto donde se va a usar 

Verificacion estatica y dinamica: 
    -Dinamica, ejecuto y me fijo el comportamiento de un producto 
    -Estatica, miro el codigo con una herramienta y detacta errores 

Hay muchos tipos de tecnicas de verificacion, nosotros nos vamos a centrar en la dinamica y especificamente en testing 

Que es hacer testing? 
-Ejecutar un programa para ver que satisface los requerimientos (la especificacion en nuestro caso)
-Identificar diferencias entre lo real y lo esperado 
-Cuesta mucho testear, no es recomendable dedicar mucho

Como se hace testing? 
Input -> Comportamiento esperado y comportamiento obtenido ---> Iguales -> Ok
  ^                                                        ---> Distintos -> Falla 
Con que conjunto de parametros lo voy a probar? 

Niveles de test:
    Test de unidad: Verificar que cada unidad de codigo funciona bien 
    Test de Integracion: Verificar que las partes de un sistema funcionan bien aisladamente y tambien en conjunto 
    Test de sistema: Comprende todo el sistema --> Test de aceptacion, el ultimo

Programa bajo test: Programa que queremos poner a prueba
Test input: Valores de entrada para ejecutar el programa bajo test 
Test case: Programa que ejecuta el programa bajo test con muchos casos de prueba (test input) para ver si el resultado esperado es igual al obtenido 
Test suite: Muchos casos de test 

problema valorAbs(n:Z) : Z {
    requiere: {True}
    asegura: {res = |n| }
}

valorAbs(0)=0
valorAbs(-1)=1
valorAbs(1)=1

-Los enteros se representan con 32 bits, necesitariamos probar 2^32 datos 
-No tiene sentido hacer testing exhaustivo, puede ser llevar muchisimo tiempo. Mismo si hiciera automatico el testing tardaria unos cuantos dias 

Conjunto de test adecuados:
    -suficientemente grande para abarcar el dominio y maximizar la probabilidad
    -suficientemente chico para que no lleve demasiado tiempo 

Intuicion: hay inputs que son "parecidos entre si"
Decidir cuando son parecidos es un tema de experiencia y practica 
No hay algoritmo que me diga que caso es bueno para probar o no o que descubra todos los errores 

Criterios: 
    -Test de caja negra: se analizan sin tener en cuenta el codigo, solo la especificacion 
    -Test de caja blanca: se analiza el codigo para determinar los casos de test 

Automatizar el testing? Si, con la herramienta HUnit para haskell 

test :: [Test] -> IO

Particion de Categorias:
1-Listar problemas 
2-Elegir uno en particular
3-Identificar parametros o relaciones que condicionan su comportamiento, los llamamos factores 
4-Caracteristicas relevantes (Categorias)
5-Elecciones para cada caracteristica de cada factor
6-Clasificar elecciones: errores, unicos, restricciones, etc 
7-Armar casos, combinando las distintas elecciones para cada categoria y detallando el resultado en cada caso 
8-Volver a 2 hasta completar todos los casos 

Ej: 
Paso1:
cantidadDeApariciones
esPermutacion 

Paso2:
cantidadDeApariciones (s:seq(T), e:T) : Z 

Paso3:
T = Z (para analizar )
s : seq(Z)
e : Z 

Paso4:
Me importa si s es vacia o no 
Relacion entre e y s, poder decir si e pertenece o no a s 

Paso5: 
s : seq(Z) tiene elementos o no? 
e pertenece a s? 

Paso6: 
s : seq(Z) no puede ser vacia, me interesan solo secuencias que tengan elementos 

Paso7:
s tiene elementos -> e pertenece a s 
s tiene elementos -> e no pertenece a s 
Unicos casos que me interesan 

Se hace una tablita con los casos posibles, voy a hacer con todos los casos mismo que tenga errores, por ej:

caso 1: s sin elementos | s no tiene elementos | e - | ERROR: no esta especificado que pasa en este caso
caso 2: e no pertenece a s | s tiene elementos | e no pertenece a s | OK: 0 

Ejemplo: 
problema elPrimEsCinco : (x : Z, y : Z) : Z {
    asegura: (x = 5 -> res = 5)
    asegura: (x /= 5 -> res = x + y)
}

Factores: 
x e y

Caracteristicas:
Me importa si x es igual a cinco (UNICO) o es distinto 

Etc...

Test: 
problema multiplosN (s : Seq(Z), n : Z) : seq(Z) 

n : Z 
- n > 0
- n = 0 (RESTRICCION)
- n < 0

s : seq(Z)
-No tiene elementos. (UNICO) 
-Tiene elementos pero sin repetir. 
-Tiene elementos repetidos. (ERROR) 

Relacion entre n y s
-0 multiplos de n es s 
-1 """"
->1 """"

ERROR: No cumple con el requiere o con el comportamiento de la funcion
UNICO: Es un caso de los factores que solo cumple con una repuesta sin importar los otros factores 
RESTRICCION: Es un caso que no necesariamente puede tener todos los otros casos de los demas factores 