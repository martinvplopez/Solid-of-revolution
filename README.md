# Solid of Revolution
## Realizado por Martín van Puffelen López
### Práctica 2 CIU: *Superficie de revolución*
___

#### Introducción
##### En esta segunda práctica, se ha implementado la operación de producir un sólido de revolución, esto es, a partir de una forma geométrica aplicar una rotación sobre una recta que está en el mismo plano para transformarlo en una superficie tridimensional. Un ejemplo puede ser un cilindro, que es el producto de rotar un rectángulo. Ver más en [Wikipedia](https://en.wikipedia.org/wiki/Solid_of_revolution).

#### Instrucciones
##### Realizar un trazo arrastrando el ratón en la parte derecha de la pantalla y pulsar la tecla (*ESPACIO*) para realizar la rotación de los vértices dibujados.

#### Recorrido interfaz
##### Al iniciar el programa se podrá apreciar un título llamativo que no entra en detalles matemáticos para que sea atractivo y accesible. También existirá un botón (**AYUDA**) donde pulsando se mostrarán instrucciones sencillas para el correcto funcionamiento. El usuario trazará una línea y al ejecutar la revolución sonará un sonido de un tifón para realzar la idea de rotación.

![Imagen Principal](https://github.com/martinvplopez/Solid-of-revolution/blob/main/Practica2_SolidoRevolucion/images/ventanaDefault.jpg)
####
![Imagen Dibujo](https://github.com/martinvplopez/Solid-of-revolution/blob/main/Practica2_SolidoRevolucion/images/ventanaDraw.jpg)
####
![Imagen Sólido](https://github.com/martinvplopez/Solid-of-revolution/blob/main/Practica2_SolidoRevolucion/images/ventanaSolido.jpg)

#### Detalles implementación
- ##### **Botón de ayuda**: es lo suficientemente sencillo para informar pero se ha decidido implementar como botón *interruptor* para que no moleste y solo se muestre al ser requerido por el usuario, mayor control y limpieza en la interfaz.
- ##### **Color**: se ha elegido el color naranja como color principal (malla del sólido e instrucciones) ya que es un color que invita a la creatividad y aporta la suficiente intensidad.
- ##### **Teclas**: *R* para que volver a dibujar, intuitiva asociación de la tecla con el concepto *reset* y *ESPACIO* para iniciar la revolución, de nuevo una tecla estándar.

#### Referencias
- [Documentación asignatura](https://github.com/otsedom/otsedom.github.io/blob/main/CIU/P1/README.md)
- [PongGame](https://www.ponggame.org/)
- [Documentación Processing](https://processing.org/reference)
