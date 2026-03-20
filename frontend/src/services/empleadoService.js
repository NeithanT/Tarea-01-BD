const API_URL = "http://localhost:5154";

export async function getEmpleados() {
  // pide la lista de empleados y espera una respuesta
  const response = await fetch(`${API_URL}/empleado`);
  return response.json();
}

export async function insertarEmpleado(nombre, salario) {
  const response = await fetch(`${API_URL}/empleado`, { // pide empleados
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ nombre, salario })
  });
  return response;
}