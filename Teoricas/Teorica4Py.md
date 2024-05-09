# Programacion Orientada a Objetos y API's
* **Programacion Orientada a Objetos:**
    * *Es un paradigma de programacion*
    * *Es pensar y organizar el codigo en termino de clases y objetos (tambien se llaman instancias)*
    * *Las clases son entidades que combinan variables (atributos) y operaciones (metodos) para definr las propiedades y comportamiento de los objetos*
    * *Las clases definen nuevos tipos de datos y los objetos pueden interactuar entre si por sus metodos y atributos*
    * *Se acerca a la forma de pensar y modelar el mundo real con TAD's, pero a nivel de lenguaje de programacion*
    * *Python esta fuertemente orientado a objetos, pero no es condicion necesaria para hacer un programa*
* **Conceptos Claves: encapsulamiento, herencia y polimorfismo (el ultimo ya lo vimos)**

*Definicion de clases en Python: ver Teorica4Py.py*
*__init__ (van pegados los guiones): metodo especial/constructor que se utiliza para inicializar los objetos de una clase*
*El primer parametro de init es self, que es una referencia al propio objeto. Todos los metodos (funciones) tienen que tener el parametro self*
*Con ese parametro se puede acceder y/o modificar los atributos del objeto*

* **Encapsulamiento:**
    * *Puede separar codigo de manera que una parte sea "publica" y otra "privada"*
    * *Los usuarios de una clase solo necesitan conocer la interfaz publica, los metodos y atributos accesibles, respetando la documentacion*
    * *Python maneja tres niveles de accesibilidad: publico, protegido y privado*
    * *Estos niveles se pueden indicar usando los guiones bajos (underscores) es los nombres de los atributos y metodos*
    * *Para el nivel protegido se usa un guion bajo, y para el privado el doble guion bajo como prefijo en los nombres*
 
* **Herencia:**
    * *Creacion de nuevas clases basadas en clases existentes, heredandno sus atributos y metodos*
    * *Las nuevas clases se llaman derivadas o subclases. La clase de la cual heredan se llama clase base o superclase*
    * *Define jerarquia de clases*
    * *Se pueden sobrecargar metodos para cada subclase*

* **Polimorfismo:**
    * *Funcion que se puede aplicar a distintos tipos de datos sin redefinirla*
    * *Se usa con clases de manera que cualquier subclase de esta primera pueda usar la funcion*

# API (Application Programming Interface)
* **API's:**
    * *Relacionar funcionalidades de un programa en otro*
    * *Define como las disintas partes de un software deben interactuar, especificando los metodos y formatos de datos para el intercambio de informacion*
    * *Encapsula el comportamiento de otro programa, y se puede ejecutar desde una computadora remota*

* *Ej: Google Translate API*
    * pip install googletrans googletrans==3.1.0a0
    * translator = Translator()
    * translate(texto, idioma origen, idioma destino)
        * src: idioma original, dest: idioma destino
        * origin: texto en idioma original
        * text: texto traducido
        * pronunciation: pronunciacion del tecto traducido
    
**BUSCAR, INVESTIGAR Y PRACTICAR ESTAS ULTIMAS 4 COSAS**
