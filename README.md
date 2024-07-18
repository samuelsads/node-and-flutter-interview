# INSTRUCCIONES BACKEND

A continuación las instrucciones para poder correr el proyecto

## INSTRUCCIONES

Lo primero que se debe hacer es clonar el repositorio desde [URL PARA CLONAR](https://github.com/samuelsads/node-and-flutter-interview.git), posterior a ello seguir los siguiente pasos

**En la carpeta backend:**

1.  **Instalar dependencias necesarias:** para ello correr el comando **npm install**

2.  **Correr el projecto:** Utilizar el siguiente comando **npm run start:dev**

## RUTAS SOPORTADAS(PUERTO 3000 localhost:3000/)

1. **/articles** -> tipo `get`
2. **/articles/:id** ->tipo `get`
3. **articles/:id** ->tipo `delete`


## LOGICA PARA LEER Y GUARDAR EL JSON SE ENCUENTRA EN:

En estas rutas encontraran la logica para leer y guardar la data del json a la base de datos, no es necesario ejecutarlo, se ejecuta cuando no existe data en la db de mongo atlas.

1.  **src/helpers/readData.js** 
2.  **src/helpers/saveData.js**  

## La información de la Base de datos y el puerto se encuentran en .env
## La base de datos se encuentra en la nube, tienen los accesos para corroborar en .env

# FRONTEND

A continuación las intrucciones para poder correr el proyecto Frontend.

## INSTRUCCIONES
La aplicación fue creada con Flutter 3.22.2, para poder correrlo se necesita abrir la carpeta frontend y seguir las instrucciones:

1.  **Ejecutar el siguiente comando**  `flutter pub get` con este comando podran bajar las dependencias del proyecto para poder usarlo de forma adecuada.
2.  **Ejecutar el siguiente comando:** `flutter run` o tambien ejectuarlo desde el menu superior `run-> start debugging`.
3. **En caso de estar desde un emulador android** se debera acceder a la ruta `lib/data/remotes/articles/http_articles_impl.dart`, descomentar el apartado que dice android en la linea 16 y comentar la linea 13, en caso de ser IOS no es necesario modificar nada

## SE CREO UNA VISTA EXTRA CON LOS ELEMENTOS DISPONIBLES

Se creo la vista solicitada con el Figma proporcionado, de igual manera se creo una segunda vista con mis propios criterios de diseño para poder visualizarla seguir las siguientes instrucciones. 

1. **Dirigirse a la siguiente ruta:** `lib/views/pages/home/home_page.dart` en la linea 50 cambiar _body() por _body1() para poder visualizar el segundo diseño.


Cualquier duda quedo atento pueden comunicarse conmigo por medio de mi mail  `samueldzibsads@gmail.com` o tambien via Whatsapp al núm que les proporcione.
