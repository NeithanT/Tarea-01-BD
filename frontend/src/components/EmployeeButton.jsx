
export default function EmployeeButton({ setCreatingEmployee }) {

    return (
        <button className="employee-button" onClick={ () => setCreatingEmployee(true)}>
            Insertar
        </button>
    );
}