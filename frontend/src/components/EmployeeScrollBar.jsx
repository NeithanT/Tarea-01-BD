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
        <div style={{ height: '200px', overflowY: 'scroll', border: '1px solid black' }}>
            <button onClick={moveColumnLeft} disabled={currentColumn === 0}>Left</button>
            <button onClick={moveColumnRight} disabled={employees.length <= currentColumn * 10 + 10}>Right</button>
        </div>
    );
}