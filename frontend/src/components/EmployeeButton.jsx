
export default function EmployeeButton({ setCreatingEmployee }) {

    return (
        <button onClick={ () => setCreatingEmployee(true)}>
            Agregar Empleado
        </button>
    );
}