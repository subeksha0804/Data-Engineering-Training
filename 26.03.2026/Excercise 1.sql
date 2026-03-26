create database company_training;
use company_training;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
department VARCHAR(50),
city VARCHAR(50)
);
CREATE TABLE projects (
project_id INT PRIMARY KEY,
emp_id INT,
project_name VARCHAR(100),
project_budget DECIMAL(12,2),
project_status VARCHAR(50)
);
INSERT INTO employees VALUES
(1, 'Rohan Mehta', 'IT', 'Hyderabad'),
(2, 'Sneha Iyer', 'IT', 'Bangalore'),
(3, 'Kiran Patel', 'Finance', 'Mumbai'),
(4, 'Ananya Das', 'HR', NULL),
(5, 'Rahul Sharma', 'IT', 'Delhi'),
(6, NULL, 'Marketing', 'Chennai');
INSERT INTO projects VALUES
(101, 1, 'AI Chatbot', 120000, 'Active'),
(102, 1, 'ML Prediction', 90000, 'Active'),
(103, 2, 'Data Warehouse', 150000, 'Active'),
(104, 3, 'Financial Dashboard', 80000, 'Completed'),
(105, NULL, 'Website Revamp', 60000, 'Pending'),
(106, 8, 'Mobile App', 100000, 'Active');
 -- ex1 --
 select  e.emp_name,
 p.project_name, 
 p.project_budget 
 from employees e 
 inner join projects p 
 on e.emp_id = p.emp_id;
-- ex 2--
select * from employees e 
left join projects p 
on  e.emp_id = p.emp_id;
-- ex3--
select * from employees e 
right join  projects p 
on e.emp_id = p.emp_id;
-- ex 4--
select * from employees e
left join projects p 
on e.emp_id = p.emp_id 
union 
select * from employees e 
right join projects p 
on e.emp_id = p.emp_id;
-- ex5
select e.emp_name, p.project_name 
from employees e
cross join projects p;
 -- ex 6
 select p.project_name, e.department
from projects p
join employees e on p.emp_id = e.emp_id
where e.department = 'it';
 -- ex 7 
 select * from projects where project_budget > 100000;
 -- ex 8
 select e.emp_name, p.project_name 
 from employees e 
 join projects p
 on e.emp_id = p.emp_id where e.city = 'hyderabad';
 -- ex 9
 select emp_id, count(project_id) 
 from projects 
 group by emp_id;
 -- ex 10
 select emp_id, sum(project_budget) 
 from projects 
 group by emp_id;
 -- ex 11
 select e.department, avg(p.project_budget)
 from employees e 
 join projects p 
 on e.emp_id = p.emp_id 
 group by e.department;
 -- ex 12
 select e.department, count(p.project_id)
 from employees e 
 left join projects p 
 on e.emp_id = p.emp_id group by e.department;
 -- ex 13
 select e.department, sum(p.total_budget)
 from employees e 
 join projects p 
 on e.emp_id = p.emp_id
 group by e.department;
 
 -- ex 14
 select city , count(emp_id) 
 from employees 
 group by city;
 -- ex 15
 select e.emp_id , count(p.project_id) 
 from employees e
 join projects p on e.emp_id = p.emp_id
 group by e.emp_id
 having count(p.project_id) > 1;
 -- ex 16
 select e.department, sum(p.project_budget)
 from employees e
 join projects p on e.emp_id = p.emp_id
 group by e.department 
 having sum(p.project_budget) > 100000;
 -- ex 17
select e.emp_id, sum(p.project_budget) 
from employees e 
join projects p on e.emp_id = p.emp_id
group by e.emp_id 
having sum(p.project_budget) > 100000;

-- capstone
select e.emp_name,e.department,sum(p.project_budget)
from employees e 
join projects p on e.emp_id = p.emp_id
group by e.emp_name, e.department
having sum(p.project_budget) > 100000
order by sum(p.project_budget)  desc;