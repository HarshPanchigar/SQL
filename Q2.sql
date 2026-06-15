create database collage;
use collage;
create table student(
	roll_no int primary key,
    name varchar(50),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

insert into student(roll_no , name, marks, grade, city) values 
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

select * from student;
SELECT roll_no , name from student;
select name,marks from student;
select distinct city from student;

select roll_no, name , marks from student where marks > 80;
select city from student where city = "Mumbai";


select * from student order by city desc limit 3;

select * from student;
select city, count(name) from student group by city;

-- // practice Q-1 - write query to find avg marks in each city in ascending order

select
city , avg(marks) 
from student 
group by city 
order by city;

select * from students order by marks desc;

-- Display the top 3 students with highest marks.

select * from students order by marks desc limit 3;

select max(marks) from students;

-- Count how many students are from each city.
select * from students group by city;

update students set id = "11" where id = "10"; 
update students set id = "10" where id = "11";
select * from students;

