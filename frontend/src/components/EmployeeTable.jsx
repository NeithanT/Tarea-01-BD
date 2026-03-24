
export default function EmployeeTable({ employees}) {
  return (
    <table className="employee-table">
        <thead>
            <tr>
                <th>id</th>
                <th>Nombre</th>
                <th>Salario</th>
            </tr>
        </thead>
        <tbody>
            {employees.map((employee) => (
                <tr key={employee.id}>
                    <td>{employee.id}</td>
                    <td>{employee.nombre}</td>
                    <td>{employee.salario}</td>
                </tr>
            ))}
        </tbody>
    </table> 
  );
}