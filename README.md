TP N°2: Pokédex (ABML con login por sesión y persistencia a BD)
Realizar una web que represente una Pokédex (listado de pokémon) y permita realizar
búsqueda sobre la misma. Además, el sistema debe permitir que el administrador se loguee
al mismo y pueda realizar altas, bajas y modificaciones de los elementos. Ejemplo de donde
pueden tomar datos: http://es.pokemon.wikia.com/wiki/Lista_de_Pok%C3%A9mon
Tip: Si no les agrada o no conocen pokémon, pueden reemplazar el contenido por el
de otro tema que los motive, siempre que se mantengan todas las funcionalidades
(Ej: Música, Jugadores de Fútbol, auto fantástico, Meteoro, etc.)
Casos de uso:
- Si se busca un pokemon existente, mostrar sólo ese.
- Si se busca un pokemon inexistente, informar "pokemon no encontrado" y - mostrar la lista
de todos ellos.
- Si no se busca nada, mostrar la lista de todos ellos
- Al ingresar al pokemon buscado, mostrar todos sus datos en una página completa
- El sistema debe permitir loguear usuarios a modo de administradores
- El tipo de pokemon (fuego, agua, hierba) debe mostrarse con una imágen. No como texto
- El usuario logueado: puede dar de alta un pokemon
- El usuario logueado: puede dar de baja un pokemon
- El usuario logueado: puede editar un pokemon
- ![maquetado1](https://github.com/GonzaloFlores1121/Pokedex/assets/122183625/097fbec0-cc67-4240-9f82-065fd4249d46)
![maquetado2](https://github.com/GonzaloFlores1121/Pokedex/assets/122183625/35ed16b5-77d0-4fa8-a835-9a1d7c343506)
![maquetado3](https://github.com/GonzaloFlores1121/Pokedex/assets/122183625/bf01269e-580f-4867-8a6f-1865bf3ce98b)
Requisitos técnicos:
- La web debe ser visualizada correctamente desde un celular o computadora (ser
responsive). Utilice w3css, bootstraps, materialize o similar
- Los datos mínimos de cada pokémon serán:
- id de base de datos autoincremental (no puede modificarse)
- Número identificador único (no autoincremental, se debe cargar a mano y se
puede editar por el administrador)
- Imagen ( subir imagen al servidor y guardar en la base de datos la ruta a la
carpeta y nombre del archivo )
- Nombre
- Tipo (seleccione al menos 4 valores posibles)
- Descripción
- agregar todos los datos extras que deseen
- Debe trabajarse sobre una base de datos MySql (MariaDb o postgre si prefieren).
- El backend debe realizarse en PHP
- Toda la lógica debe residir del lado del servidor en PHP
- No utilice Ajax ni funciones complejas de js
- Entregar un archivo comprimido .zip que contenga:
- código del sitio
- sql para crear la base del sitio y sus datos
- debe poder corregirse descomprimiendo el zip sobre el raíz del apache y
accediendo a localhost<puerto>:// chequee en la computadora de algún
compañero que esto funcione
