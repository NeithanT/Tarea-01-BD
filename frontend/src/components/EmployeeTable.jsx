
export default function EmployeeTable({ employees}) {
  return (
    <div className="employee-table-container">
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
              <td>₡{Number(employee.salario).toLocaleString('fr-FR', { maximumFractionDigits: 0 })}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}