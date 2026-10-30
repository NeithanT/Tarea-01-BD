# Gestor de Empleados - Tarea 01 (BD)

Sistema full-stack para la consulta y registro de empleados, implementado con una arquitectura desacoplada utilizando **React**, **ASP.NET Core** y **SQL Server**, todo orquestado mediante **Docker Compose**.

---

## 🛠️ Tecnologías

- **Frontend:** React (Vite)
- **Backend:** .NET 9 (ASP.NET Core Minimal API + Dapper)
- **Base de Datos:** Microsoft SQL Server 2022 (con procedimientos almacenados)
- **Despliegue/Contenedores:** Docker & Docker Compose

---

## 📁 Estructura del Repositorio

- `backend/`
  - `API/`: Código fuente de la API REST en .NET.
  - `database/`: Scripts de inicialización de la base de datos (`init-db.sql`, `setup.sh`) con la tabla `Empleado`, procedimientos almacenados y datos iniciales.
- `frontend/`: Interfaz de usuario en React para visualización y registro de empleados.
- `docker-compose.yml`: Archivo de orquestación para levantar automáticamente la BD, API y Frontend.

---

## 🚀 Inicio Rápido (Recomendado)

Teniendo instalado **Docker** y **Docker Compose**:

1. Levantar todos los servicios:
   ```bash
   docker compose up --build
   ```

2. Acceder a los servicios:
   - **Frontend:** [http://localhost:5173](http://localhost:5173)
   - **API Backend:** [http://localhost:5154/empleado](http://localhost:5154/empleado)
   - **SQL Server:** Puerto `1433` (Usuario: `sa`, Contraseña: `YourStrong1Pass`)

---

## 🔌 Endpoints de la API

| Método | Endpoint | Descripción | Body (JSON) |
|---|---|---|---|
| `GET` | `/empleado` | Retorna la lista de empleados | N/A |
| `POST` | `/empleado` | Inserta un nuevo empleado | `{ "nombre": "Nombre Apellido", "salario": 250000.00 }` |

---

## 💻 Ejecución Local (Sin Docker)

- **Backend:**
  ```bash
  cd backend/API
  dotnet run
  ```
- **Frontend:**
  ```bash
  cd frontend
  npm install
  npm run dev
  ```
