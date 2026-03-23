import { useState } from "react";
import EmployeeTable from "./components/EmployeeTable";
import EmployeeButton from "./components/EmployeeButton";
import EmployeeForm from "./components/EmployeeForm";
import EmployeeScrollBar from "./components/EmployeeScrollBar";

function App() {

  const [employees, setEmployees] = useState([ {"id": 1, "name": "John Doe", "salary": 50000}, {"id": 2, "name": "Jane Smith", "salary": 60000}, {"id": 3, "name": "Bob Johnson", "salary": 70000}, {"id": 4, "name": "Alice Williams", "salary": 80000}, {"id": 5, "name": "Charlie Brown", "salary": 90000}, {"id": 6, "name": "Diana Miller", "salary": 100000}, {"id": 7, "name": "Eve Davis", "salary": 110000}, {"id": 8, "name": "Frank Wilson", "salary": 120000}, {"id": 9, "name": "Grace Moore", "salary": 130000}, {"id": 10, "name": "Henry Taylor", "salary": 140000}, {"id": 11, "name": "Ivy Anderson", "salary": 150000}, {"id": 12, "name": "Jack Thomas", "salary": 160000}, {"id": 13, "name": "Karen Jackson", "salary": 170000}, {"id": 14, "name": "Leo White", "salary": 180000}, {"id": 15, "name": "Mia Harris", "salary": 190000}, {"id": 16, "name": "Nina Martin", "salary": 200000}, {"id": 17, "name": "Oscar Lee", "salary": 210000}, {"id": 18, "name": "Paul Walker", "salary": 220000}, {"id": 19, "name": "Quinn Hall", "salary": 230000}, {"id": 20, "name": "Rachel Allen", "salary": 240000} ]);
  const [currentEmployees, setCurrentEmployees] = useState(employees.slice(0, 10));
  const [creatingEmployee, setCreatingEmployee] = useState(false);
  //const [newEmployeeName, setNewEmployeeName] = React.useState({ name: "" , salary: "" });

  return (
    <>
    
    <div className="Title">
      <h1>Gestor de Empleados</h1>
    </div>
    
    <EmployeeTable employees={currentEmployees} setEmployees={setEmployees} />

    <EmployeeScrollBar employees={employees} setCurrentEmployees={setCurrentEmployees} />

    <EmployeeButton setCreatingEmployee={setCreatingEmployee} />
    
    {creatingEmployee && (
      <EmployeeForm />
    )}

    </>
    
  );
}

export default App;