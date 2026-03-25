import { useEffect, useState } from "react";
import EmployeeTable from "./components/EmployeeTable";
import EmployeeButton from "./components/EmployeeButton";
import EmployeeForm from "./components/EmployeeForm";
import EmployeeScrollBar from "./components/EmployeeScrollBar";

function App() {
  const [employees, setEmployees] = useState([]);
  const [currentEmployees, setCurrentEmployees] = useState([]);
  const [creatingEmployee, setCreatingEmployee] = useState(false);

  const loadEmployees = async () => {
    try {
      const response = await fetch("http://localhost:5154/empleado");
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }
      const data = await response.json();
      const employeesArray = Array.isArray(data)
        ? data
        : Object.keys(data).map((key) => ({ id: key, ...data[key] }));
      setEmployees(employeesArray);
      console.log("Empleados cargados:", employeesArray);
    } catch (error) {
      console.error("Error fetching empleados:", error);
    }
  };

  useEffect(() => {
    loadEmployees();
  }, []);

  return (
    <>
    
    <div className="Title">
      <h1>Gestor de Empleados</h1>
    </div>
    
    <EmployeeTable employees={currentEmployees} allEmployees={employees} setCurrentEmployees={setCurrentEmployees}/>

    <EmployeeScrollBar employees={employees} setCurrentEmployees={setCurrentEmployees} />

    <EmployeeButton setCreatingEmployee={setCreatingEmployee} />
    
    {creatingEmployee && (
      <EmployeeForm setCreatingEmployee={setCreatingEmployee} onReload={loadEmployees} />
    )}

    </>
    
  );
}

export default App;