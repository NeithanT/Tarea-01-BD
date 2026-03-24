import { useEffect, useState } from "react";

export default function EmployeeScrollBar({ employees, setCurrentEmployees }) {

    const [currentColumn, setCurrentColumn] = useState(0);


    useEffect(() => {
        setCurrentEmployees(employees.slice(currentColumn * 10, currentColumn * 10 + 10));
    }, [employees, currentColumn, setCurrentEmployees]);

    const moveColumnRight = () => {
        if (employees.length > currentColumn * 10 + 10) {
            setCurrentColumn(currentColumn + 1);
        }
    }

    const moveColumnLeft = () => {
        if (currentColumn >= 1) {
            setCurrentColumn(currentColumn - 1);
        }
    }

    return (
        <div className="employee-scrollbar">
            {/* Left Arrow we are loading the left-arrow.svg and set them to 20x20*/}
            <button onClick={moveColumnLeft} disabled={currentColumn === 0}>
                <img src="src/assets/left-arrow.svg" width="20" height="20"/>
            </button>
            <button onClick={moveColumnRight} disabled={employees.length <= currentColumn * 10 + 10}>
                <img src="src/assets/right-arrow.svg" alt="Right Arrow" width="20" height="20"/>
            </button>
        </div>
    );
}