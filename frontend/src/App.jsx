import React from "react";

function App() {

  const [employees, setEmployees] = React.useState([]);
  const [creatingEmployee, setCreatingEmployee] = React.useState(false);
  const [newEmployeeName, setNewEmployeeName] = React.useState({ name: "" , salary: "" });
  
  return (
    <>

    <div>
      <h1>Titulo</h1>
    </div>
    
    <div>
      <h2>tabla {employees.length}</h2>
    </div>

    <div>
      <h3>boton</h3>
    </div>
    
    {creatingEmployee && (
      <div>
        <h4>Crear Empleado</h4>
      </div>
    )}

    </>
  );
}

export default App;