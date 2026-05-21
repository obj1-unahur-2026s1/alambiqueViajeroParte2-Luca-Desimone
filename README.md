#  El alambique viajero Parte 2

## Parte 1 RESUELTO (Los Viajes de Luke)

![Luke](./img/luke.jpg)

A Luke le gusta viajar por el mundo y traerse recuerdos. 
Suele ir en el "alambique veloz" pero en ocasiones cambia de vehículo.

Averiguar:
1. Cuántos lugares visitó Luke
2. El recuerdo que se trajo del último lugar que visitó

Para ello es necesario tener en cuenta:

Cuando viaja se trae un recuerdo típico del lugar visitado que conserva en un lugar destacado de su casa. El problema es que su casa es pequeña, por lo que tira el recuerdo que haya traído de algún viaje anterior. El vehículo utilizado para viajar sufre las consecuencias. Cuando pretende visitar una ciudad a la que no puede ir, simplemente no va. 

Se conocen los siguientes recuerdos:
- El recuerdo típico de París es un llavero de la torre eiffel.
- Buenos Aires tiene como recuerdo típico un mate, pero dependiendo de quién sea el presidente puede venir con yerba o no.
- El recuerdo típico de Bagdad va cambiando con los años, en algún momento pudo haber sido un bidón con petróleo crudo, alguna de las armas de destrucción masiva que nunca se encontraron o una réplica de los míticos jardines colgantes de Babilonia. O tal vez en el momento que viaje Luke sea otro diferente. 
- Las Vegas, mas que tener algo típico propio, hace "homenaje" a otros lugares. Por ejemplo, si es visitada cuando se está conmemorando a París, el recuerdo es también el llavero de la torre eiffel y si se estuviera recordando a Buenos Aires, sería el mate. 
- Cada viaje que hace el alambique veloz consume una cierta cantidad de combustible. 

Para poder ir a las ciudades, hay diferentes restricciones en las que interviene el vehículo que maneja Luke, que en principio es el Alambique veloz:
- París, tiene que tener suficiente combustible
- Buenos Aires, tiene que ser rápido
- Bagdad no hay restricciones
- Las Vegas: la misma restricción del lugar que se esté homenajeando 

Nuevos requerimientos:

Agregar otros vehículos que pueda usar Luke para viajar, en vez del Alambique Veloz. Definir su estado interno y su comportamiento con creatividad, de manera que a pesar de ser diferentes, puedan también ser usados por Luke para viajar de acuerdo a lo planteado anteriormente. Por ejemplo:
- El súper chatarra especial podría tener información de cañones o municiones, con lo cual se deduce su combustible que tenga.
- La Antigualla Blindada podria tener una cantidad de gangster variable, de lo cual depende que sea rápido o que se modifique cuando viaja.
- El SuperConvertible puede variar su comportamiento según en qué esté convertido

Crear un nuevo destino turístico.

## Parte 2 (Los autos Locos)

Los autos locos quieren participar en carreras alrededor del mundo.

![AutosLocos](./img/autosLocos.jpg)

### La inscripción

Los vehículos que quieran participar de la carrera deben inscribirse en el centro de inscripción. Cuando el centro recibe un vehículo verifica si puede o no competir en la ciudad donde acontecerá la carrera, si no puede no lo inscribe pero lo deja en una lista de rechazados. 
Puede ocurrir que durante el periodo de inscripción, antes que comience la carrera, haya una replanificación que implique cambiar la ciudad donde acontecerá la carrera. Si esto ocurre se vuelve a verificar que todos los vehículos anotados estén en condiciones de competir en la nueva ciudad, descartando a los que no lo estén y eventualmente incorporando a los que fueron rechazados anteriormente pero que puedan participar en la nueva sede. 

### La realización de la carrera

Cuando llega el momento oportuno, se le avisa a todos los vehículos anotados que vayan a la ciudad, lo cual implica que todos sufran las consecuencias del viaje (de la misma forma que la parte 1) 
El objetivo central es obtener al ganador de la carrera, que es el vehículo que completa la carrera en menos tiempo.  

### Las ciudades

Los requisitos para participar de las carreras en cada ciudad son los mismos que para viajar a ella (Como en la parte 1, el requisito para ingresar a Paris es que el vehículo pueda circular, lo que en el caso del Alambique Veloz sigue siendo que tenga el tanque lleno, pero para los demás vehículos la forma de determinarlo es diferente; en Buenos Aires, que el vehículo sea considerado rápido y de manera similar en las otras ciudades)

### Nuevos vehículos

Agregar estos nuevos vehículos:
- Uno de los autos, la "Antigualla Blindada" está integrada por varios gangsters, de quienes sólo conocemos sus nombres. Si bien originalmente son 7, antes de la carrera podrían bajarse alguno o subirse alguno más. Su velocidad se calcula a partir de la cantidad de letras de todos los nombres juntos. 
- El vehículo conducido por Pierre Nodoyuna y Patán si bien es más rápido que muchos otros, siempre intentan hacer trampas o perjudicar a los otros corredores y terminan tardando más en llegar a la meta.
- El profesor Locovich usa un vehículo que va cambiando de forma y simula ser otros. Implementarlo con una lista de posibles vehículos en los que se puede convertir sucesivamente y permitir que lo haga antes que comience la carrera.

### Pruebas

Hace algunos tests relevantes, en particular quien gana la carrera en los diferentes lugares donde podría hacerse.

