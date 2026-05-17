CREATE DATABASE employee_tracker;
USE employee_tracker;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    clock_in DATETIME,
    clock_out DATETIME,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
CREATE TABLE tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    tasks_completed INT,
    task_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
INSERT INTO employees VALUES
(1,'Rahul','HR'),
(2,'Sneha','IT'),
(3,'Amit','Finance');
INSERT INTO attendance(employee_id, clock_in, clock_out)
VALUES (1,'2026-05-01 09:00:00','2026-05-01 18:00:00');
SELECT * FROM attendance; 
UPDATE employees
SET department='Admin'
WHERE employee_id=1; 
DELETE FROM tasks
WHERE task_id=1;

DELIMITER //

CREATE PROCEDURE total_work_hours()
BEGIN
SELECT employee_id,
TIMESTAMPDIFF(HOUR, clock_in, clock_out) AS total_hours
FROM attendance;
END //

DELIMITER ;

CALL total_work_hours();


