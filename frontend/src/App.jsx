import React from "react";

function App() {

  const [employees, setEmployees] = React.useState([]);
  const [creatingEmployee, setCreatingEmployee] = React.useState(false);
  //const [newEmployeeName, setNewEmployeeName] = React.useState({ name: "" , salary: "" });

  return (
    <>
    <div>
      <h1>Titulo</h1>
    </div>
    
    <EmployeeTable employees={employees} setEmployees={setEmployees} />

    <EmployeeAddButton />
    
    {creatingEmployee && (
      <EmployeeForm />
    )}

    </>
  );
}

export default App;