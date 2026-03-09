

instalarse SDK .NET(dotnet), docker, nodejs

Comandos:

Para el BackEnd

Vamos a usar azure, para hacer facil las cosas,

docker tambien seria una opcion:

Primero, tener la imagen de docker, esto es como instalarse el sql server express

-	docker pull mcr.microsoft.com/mssql/server:2022-latest

Ejecutar la base de datos sin nada:
-	docker run -e "ACCEPT_EULA=Y"            -p 1433:1433            --name sqlserver2022            -d mcr.microsoft.com/mssql/server:2022-latest

"Esto crea un contenedor con esa sqlserver, y tiene el nombre de sqlserver2022"

Pueden ver los contenedores activos con:
-	docker ps -a

Entonces para detenerlo o borrar la instancia se puede:
-	docker stop sqlserver2022
-	docker rm sqlserver2022

Ejecutarla con Volumes/Bind Mounts(Que se guarden los datos entre sesiones)
Primero se creo, el volume(un espacio en su compu):
-	cd backend/database
-	docker volume create sqlservervol
-	docker volume ls "Ver los volumen"

Ahorra correr sqlserver
-	docker run -e "ACCEPT_EULA=Y"            -p 1433:1433            --name sqlserver2022            -d             --mount source=sqlservervol,target=/var/lib/sqlserver mcr.microsoft.com/mssql/server:2022-latest

Ahora cosas para la DB:

Se necesita usar ya sea SMSS(Studio Managment Sql Server)
o la extension de sql server de vscode
y conectarse a la base de datos con la contra y el port de antes

Algunas cosas de sql:

CREATE DATABASE users;
USE users;
CREATE TABLE test_table (

somevalue VARCHAR(50)

);
INSERT INTO test_table (somevalue) VALUES ('Test Insert');
COMMIT;
SELECT somevalue FROM test_table;

Para dotnet o .NET:

estos son algunos comandos:

-	dotnet new webapi -o backend "Crear el proyecto"
-	dotnet dev-certs https --trust "Confiar en los certificados"
-	dotnet run watch "Ejecutar la weada en port 5154"

para ver la API, ir al puerto en su navegador(google)
http://localhost:puerto

Para el Frontend

Necesitamos nodejs, nodejs es un runtime(el programa que lo ejecuta) del lenguaje javaScript

nodejs tiene un packet manager, osea una appstore para librerias, que se llama npm

- npm create vite@latest my-react-app -- --template react
- cd my-react-app
- npm install
- npm run dev

http://localhost:puerto
