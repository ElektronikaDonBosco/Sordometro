# Sordometro

## Introduccion

Este proyecto nace de nuestra experiencia personal trabajando en el taller y de nuestra infancia en comedores escolares. Estos dos entornos y tantos otro similares que se pueden encontrar en nuestro centro educativo son entornos ruidosos y ajetreados, con posibilidad de llear a dañar nuestro sistema auditivo sin siquiera uno darse cuenta.

Habiendo analizado estos escenarios hemos decidido diseñar y montar un dispositivo que mida el nivel de presion sonora y el tiempo en el que este nivel llegaria a causar daño auditivo, tras conseguir estos datos el dispositivo seria capaz de enseñar los datos en una pantalla, todo en un formato compacto capaz de ser colocado con facilidad en cualquier entorno en el que su uso pueda ser necesitado.

Siendo este dispositivo en su naturaleza un dosimetro sonoro (instumetro de medicion de presion sonora) el cual tambien calcula el daño auditivo, el nombre Sordometro nos parecio adecuado para representar el proyecto.


## Planteamiento

*Este es nuestro link hacia la planificacion (organigrama) que hemos desarrollado https://trello.com/invite/b/8RXYTQzc/c8e4bea1b8927ca968e30a7372cd1c63/sordometro*

El planteamiento inicial del proyecto es sencillo, tenemos una entrada (el microfono) y una salida (la pantalla). Es lo que connecta estos dos componentes y lo que hace que el uno se adapte al otro donde realmente entra lo compliacado del proyecto. 

Dentro del sistema de funcionamento del dispositivo tenemos varios componentes que trabajan a diferentes voltajes y diferenntes tipos de señal. El microfono, por ejemplo, recoge ondas de sonido las cuales al transformarlas a electricidad se convierte en corriente alterna, la cual no podria ser enseñada en una pantalla porque esta usa corriente continua. Este microfono tambien necesita su alimentacion correcta y su circuito adecuado para el optimo funcionamiento. Este seria el primer bloque funcional importante del sistema, que como todo lo mencionado en este planteamiento sera analizado mas en profundidad a lo largo del documento. 

La señal que el microfono genera es despues enviada a un conversor analogico digital (ADS1115) con este chip conseguimos convertir la señal analogica de audio en una señal diital que es luego enviada a una Raspberry PI mediante el protocolo de comunicacion I2C. La Raspberry PI es el segundo bloque funcional del dispositivo junto a la pantalla. La raspberry es la encargada de leer los datos que le llegan del conversor y hacer los calculos de los decibelios y los calulos del daño auditivo gracias a datos previamente analizados en estudios de terceros. Estos datos junto al diseño visual del display han sido programados en java usando el software de programacion grafica Processing 3.5.3

Finalmente teniendo claros todos los componentes del sistema, el ultimo paso seria el de oranizar todo el cableado de una manera sencilla y facil de modificar si fuera necesario, cerrando todo con un chasis impreso en 3D que estaria atornillado a la pantalla.


## Lectura del sonido



## Rasperry PI y Display

Para entender como llegan los datos a la raspberry es importante entender tambien que es la comunicaccion I2C y como funciona esta:

I2C o IIC (Circuito Inter-Integrado) es un protocolo de comunicaion el cual su proposito prinipal es conectar varios componentes de una red de dispositivos electronicos para que trabajen entre si. Este sistema se oraniza de tal manera: hay un componente meastro el qual es quien manda en la comunicacion. Este componente, normalmente microcrontroladores y micrordenadores, es el encargado en dar las ordenes de que informacion, de quien, cuando y a que velocidad se envia en el protocolo de comunicacion. El otro componente es el esclavo, el cual puede ser un sensor un microcontrolador e incluso otro micrordenador. El esclavo trabaja a merced del maestro, cuando este le ordena que envie un dato el esclavo lo hace. Este sistema puede estar formado por varios maestros y varios esclavos al mismo tiempo, la comunicacion se transmite con dos puertos el SDA (Serial Data) y el SCL (Serial Clock). Estos puertos a los cuales los componentes son conectados son los que hacen que el sistema funcione, el SDA es el puerto que recibe los datos del esclavo y los conduce al maestro, el SCL es un clock que determina la velocidad y el formato de la comunicacion, asurandose de que se adapte la velocidad a la ordenada por el maestro. En la foto que se observa a continuacion se puede apreciar una conexion estandar de un sistema i2c: 

<p align="center">
  <img width="500" height="300" src="ImagenesReadME/I2C-communication-Bus.jpg">
</p>

Sabiendo la teoria del protocolo I2C estos serian los pasos para configurarla en la Raspberry PI, teniendo en cuenta que tenemos una raspberry iniciada desde cero:
·Lo primero seria activar los puertos I2C de la raspberry, para esto usamos el comando *sudo raspi-config* en el terminal. Despues bajamos hasta *Interface Options*, aqui seleccionamos *I2c* y le damos a *Yes* tras esto reiniciamos la raspberry.
·Una vez teniendo la interfaz I2C activada tenemos que instalar un par de utilidades de la raspberry, para eso insertamos en el terminal los siguientes dos comandos:
  *sudo apt-get install -y python-smbus*
  *sudo apt-get install -y i2c-tools*
  Reiniciamos el sistema con *sudo reboot*
·Ahora tenemos que conectar el conversor ADS1115 a la raspberry siguiendo el siguiente esquema:

<p align="center">
  <img width="500" height="300" src="Sonometro_MARK3/setup.png">
</p>

  EL conversor puede tener 4 direcciones distintas, podemos cambiar las direcciones conectando el puerto ADDR a los puertos del mismo conversor de GND, VDD, SCL o SDA. Estas       direcciones aparecerian en la raspberry con el siguiente nombre: 0x48, 0x49, 0x4B y 0x4A en su respetcivo orden, siendo 0x48 la direccion por defecto si no conectamos nada al   pin ADDR.
  
 ·Para comprobar si la raspberry esta leyendo nuestro conversor ejecutamos el siguiente comando en el terminal: *i2cdetect -y 1*. Siendo el siguiente el resultado:
 pi@raspberrypi ~ $ *i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- 48 -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

  Aqui se pueden onbservar todas las direcciones posibles del protocolo I2C que puede leer la raspberry, el numero 48 que se puede apreciar representa correctamente a nuestro conversor ADS1115.
  
  






