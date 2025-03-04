# Proyecto de Modelado SQL

## Descripción del Proyecto

El objetivo de este proyecto es diseñar y crear una base de datos que cumpla con los siguientes requisitos: 

- Necesito registrar los socios del videoclub. Al menos necesito su nombre y apellidos,
fecha de nacimiento, teléfono y su número de identificación (DNI, Pasaporte, o el nombre
que reciba en tu país) y nosotros le asignaremos un número de socio que usaremos para
hacer carnets (definitivamente tu primo se quedo en algún momento de los 90’s ).
- Necesito registrar la dirección de correspondencia de los socios para, eventualmente,
hacer campañas de publicidad, pero no es un requisito obligatorio que un socio nos de
esa información. Con el código postal, calle, número y piso es suficiente,
sobreentendemos que será de la misma ciudad donde esta el videoclub.
- Necesito registrar las películas. Puedo tener más de una copia de cada una. De cada
película necesito registrar el título, género, director y sinopsis.
- Necesito saber a que socio le he prestado cada copia y cuando. Es decir, registrar la
fecha en la que se la ha llevado y la fecha de la devolución. Cuando una película no tiene
fecha de devolución, la consideramos prestada.
- Para ir tirando, necesito consultar a menudo que películas están disponibles para
alquilar en este momento (no están prestadas). Necesito saber el título de la película y el
número de copias disponibles

## Diagrama de Entidad-Relación

![Diagrama de Entidad-Relación](diagrama.png)

## Diagrama alternativo

![Diagrama de Entidad-Relación](alternativa.png)

En este diagrama alternativo, se introduce una tabla intermedia CopiaPelicula para gestionar de manera más precisa el estado de cada copia individual de una película.

### Ventajas de este enfoque:

- Permite registrar qué copia específica ha sido alquilada por un socio.
- El campo estado en CopiaPelicula brinda mayor control sobre cada copia, pudiendo indicar si está disponible, alquilada, rota, perdida, entre otros estados.
- Facilita el seguimiento detallado del inventario y la gestión de copias dañadas o extraviadas.

### Diferencias clave con el modelo original:

- Se modifica la tabla Alquiler para referenciar directamente una copia específica de una película en lugar de la película en general.
- Se refuerza la relación entre Pelicula y CopiaPelicula, permitiendo un control más granular sobre la disponibilidad de cada copia.

Este modelo requiere una actualización tanto en la tabla Alquiler como en CopiaPelicula, pero ofrece una mayor flexibilidad y precisión en la gestión de los alquileres y el estado de cada copia en el videoclub.

## Licencia

Este proyecto está bajo la Licencia MIT.

## Contacto

Para cualquier consulta o sugerencia, por favor contacta a [oscar.caasmontes@gmail.com](mailto:oscar.caasmontes@gmail.com).
