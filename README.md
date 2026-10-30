# Tarea 01 - Gestor de Empleados

Aplicación para consultar y registrar empleados en una base de datos.

## Componentes del Proyecto

- **Base de Datos:** SQL Server 2022 con una tabla de empleados y procedimientos almacenados para consultar e insertar registros.
- **Backend:** API en .NET que se conecta a la base de datos y provee las rutas para obtener y guardar empleados.
- **Frontend:** Interfaz web en React que muestra la lista de empleados y un formulario para registrar nuevos.

## Estructura

- `backend/`: Contiene el proyecto de la API en .NET y los scripts SQL de inicialización.
- `frontend/`: Contiene el código de la aplicación web en React.
- `docker-compose.yml`: Configuración para levantar la base de datos, el backend y el frontend al mismo tiempo.

## Cómo Ejecutar

La forma recomendada de correr el proyecto es mediante Docker Compose:

1. Ejecutar en la terminal desde la raíz del proyecto:
   ```bash
   docker compose up --build
   ```

2. Acceder a los servicios:
   - Frontend: http://localhost:5173
   - API: http://localhost:5154/empleado

## Rutas de la API

- `GET /empleado`: Retorna la lista de empleados registrados.
- `POST /empleado`: Registra un empleado nuevo enviando en formato JSON:
  ```json
  {
    "nombre": "Nombre Apellido",
    "salario": 250000.00
  }
  ```
