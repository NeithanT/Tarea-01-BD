var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

// 1433
// DAPPER
// sql.connection()

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();

app.MapGet("/empleado", () =>
{
    //connection.("SELECT * FROM Empleado;")
    return "empleado";
});

app.MapPost("/empleado", () =>
{
    return "empleado";
});

app.Run();