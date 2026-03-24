
export default function EmployeeForm({ setCreatingEmployee, onReload }) {

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!e.target.nombre.value || !e.target.salario.value) {
            console.log("Campos vacios");
            return;
        } else if (isNaN(e.target.salario.value) || Number(e.target.salario.value) <= 0) {
            console.log("No es un salario valido");
            return;
        } else if (e.target.nombre.value.length > 128) {
            console.log("El nombre es demasiado largo");
            return;
        }

        const formData = new FormData(e.target);
        const employee = Object.fromEntries(formData);

        console.log("Enviando empleado: ", JSON.stringify(employee));

        try {
            const response = await fetch("http://localhost:5154/empleado", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(employee),
            });

            const result = await response.json();

            if (!response.ok) {
                console.error("Error del servidor al agregar empleado:", result);
                return;
            }

            onReload();
            setCreatingEmployee(false);
            console.log("Empleado agregado con éxito", result);

        } catch (error) {
            console.error("Error al agregar empleado:", error);
        }
    };

    return (
    <div className='employee-form'>
        <form onSubmit={handleSubmit}>
            <div className='row'>
                <label htmlFor="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" />
            </div>
            

            <div className='row'>
                <label htmlFor="salario">Salario:</label>
                <input type="number" id="salario" name="salario" />
            </div>
            
        </form>

        <div className='form-buttons'>
            <button type="submit">Insertar</button>
            <button type="button" onClick={() => setCreatingEmployee(false)}>Regresar</button>
        </div>
        
    </div>
    );
}
