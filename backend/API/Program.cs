using Microsoft.Data.SqlClient;
using Dapper;
using System.Data;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddOpenApi();

// Permitir peticiones desde el frontend del backend (que no se bloquee la info)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowFrontend", policy =>
    {
        policy.WithOrigins("http://localhost:5173", "http://localhost:3000", "http://localhost:8080", "http://25.32.168.107:5173", "http://25.32.168.107:3000", "http://25.32.168.107:8080")
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseCors("AllowFrontend");
// Conecta a SQL server
string connectionString = builder.Configuration.GetConnectionString("DefaultConnection")
    ?? "Server=localhost,1433;Database=Tarea01;User Id=sa;Password=YourStrong1Pass;TrustServerCertificate=True;";

// GET
app.MapGet("/empleado", async () =>
{
    try
    {
        using var connection = new SqlConnection(connectionString);

        var parameters = new DynamicParameters();
        parameters.Add("@outResultCode", dbType: DbType.Int32, direction: ParameterDirection.Output);

        var empleados = await connection.QueryAsync<Empleado>(
            "dbo.ListarEmpleados",
            parameters,
            commandType: CommandType.StoredProcedure
        );

        return Results.Ok(empleados);
    }
    catch (Exception ex)
    {
        return Results.Problem($"Error al obtener empleados: {ex.Message}");
    }
});

// POST
app.MapPost("/empleado", async (EmpleadoDto empleadoDto) =>
{
    try
    {
        using var connection = new SqlConnection(connectionString);

        var parameters = new DynamicParameters();
        parameters.Add("@inNombre", empleadoDto.Nombre);
        parameters.Add("@inSalario", empleadoDto.Salario);
        parameters.Add("@outResultCode", dbType: DbType.Int32, direction: ParameterDirection.Output);

        await connection.ExecuteAsync(
            "dbo.InsertarEmpleado",
            parameters,
            commandType: CommandType.StoredProcedure
        );

        var resultado = parameters.Get<int>("@outResultCode");

        if (resultado == 0) // codigo 200 de exito
        {
            return Results.Ok(new { mensaje = "Empleado insertado exitosamente" });
        }
        else if (resultado == 50001) // codigo 400 de error por nombre repetido
        {
            return Results.BadRequest(new { mensaje = "Nombre de Empleado ya existe." });
        }
        else // algun otro valor de error
        {
            return Results.Problem("Error al insertar empleado");
        }
    }
    catch (Exception ex)
    {
        return Results.Problem($"Error al insertar empleado: {ex.Message}");
    }
});

// Inicia la aplicación
app.Run();
record Empleado(int id, string Nombre, decimal Salario);
record EmpleadoDto(string Nombre, decimal Salario);