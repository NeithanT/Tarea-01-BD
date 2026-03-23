import { useEffect, useState } from "react";
import EmployeeTable from "./components/EmployeeTable";
import EmployeeButton from "./components/EmployeeButton";
import EmployeeForm from "./components/EmployeeForm";
import EmployeeScrollBar from "./components/EmployeeScrollBar";

function App() {
  const [employees, setEmployees] = useState([]);
  const [currentEmployees, setCurrentEmployees] = useState([]);
  const [creatingEmployee, setCreatingEmployee] = useState(false);

  useEffect(() => {
    fetch("http://localhost:5154/empleado")
      .then((response) => response.json())
      .then((data) => {
        const employeesArray = Object.keys(data).map((key) => ({
          id: key,
          ...data[key],
        }));
        setEmployees(employeesArray);
        console.log(employeesArray);
      })
      .catch((error) => {
        console.error("Error fetching empleados:", error);
      });

  }, []);

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