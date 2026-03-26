create database capstone_sql;
use capstone_sql;
create table students (
    student_id int primary key,
    student_name varchar(100),
    city varchar(50),
    age int
);
create table enrollments (
    enrollment_id int primary key,
    student_id int,
    course_name varchar(100),
    trainer varchar(100),
    fee decimal(10,2)
);
insert into students values
(1, 'aarav sharma', 'hyderabad', 22),
(2, 'priya reddy', 'bangalore', 23),
(3, 'rahul verma', 'mumbai', 24),
(4, 'sneha kapoor', null, 21),
(5, 'vikram singh', 'chennai', 25),
(6, null, 'delhi', 22);

insert into enrollments values
(101, 1, 'mysql', 'abdullah khan', 5000),
(102, 1, 'python', 'abdullah khan', 7000),
(103, 2, 'power bi', 'kiran', 6000),
(104, 3, 'azure data factory', 'sneha', 8000),
(105, null, 'excel', 'rohan', 3000),
(106, 8, 'databricks', 'ananya', 9000);
 -- ex 1
select s.student_name, e.course_name 
from students s 
inner join enrollments e
 on s.student_id = e.student_id;
 -- ex 2
select s.student_name, e.course_name 
from students s 
left join enrollments e
 on s.student_id = e.student_id;
 -- ex 3
select s.student_name, e.course_name 
from students s 
right join enrollments e 
on s.student_id = e.student_id;
-- ex 4
select s.student_name, e.course_name
from students s 
left join enrollments e 
on s.student_id = e.student_id
union
select s.student_name, e.course_name 
from students s 
right join enrollments e 
on s.student_id = e.student_id;
-- ex 5 
select s.student_name, e.course_name 
from students s 
cross join enrollments e;
-- ex 6
select s.student_name, e.course_name 
from students s 
inner join enrollments e on s.student_id = e.student_id 
where s.city = 'hyderabad';
-- ex 7
select course_name, fee 
from enrollments 
where fee > 6000; 
-- ex 8
select student_id, count(course_name) as total_courses 
from enrollments 
group by student_id;
-- ex 9
select student_id, sum(fee) as total_fee 
from enrollments 
group by student_id;
-- ex 10
select student_id 
from enrollments 
group by student_id 
having count(course_name) > 1;
-- ex 11
select trainer, sum(fee) as total_collected 
from enrollments 
group by trainer 
having sum(fee) > 10000;
-- ex 12
select city 
from students 
group by city 
having count(student_id) > 1;
-- capstone
select s.student_name, s.city, sum(e.fee) as total_fee_paid
from students s
join enrollments e on s.student_id = e.student_id
group by s.student_name, s.city
having sum(e.fee) > 5000
order by total_fee_paid desc;