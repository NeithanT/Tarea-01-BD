
export default function EmployeeTable({ employees, setEmployees }) {
  return (
    <table>
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
                    <td>{employee.name}</td>
                    <td>{employee.salary}</td>
                </tr>
            ))}
        </tbody>
    </table> 
  );
}