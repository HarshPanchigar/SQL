use collage;
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    city VARCHAR(50),
    marks INT
);

INSERT INTO students
VALUES
(1, 'Harsh', 20, 'Ahmedabad', 85),
(2, 'Raj', 19, 'Surat', 72),
(3, 'Priya', 21, 'Rajkot', 91),
(4, 'Amit', 22, 'Ahmedabad', 67),
(5, 'Neha', 20, 'Surat', 88),
(6, 'Karan', 18, 'Vadodara', 55),
(7, 'Riya', 19, 'Rajkot', 95),
(8, 'Vivek', 21, 'Ahmedabad', 78),
(9, 'Anjali', 20, 'Vadodara', 82),
(10, 'Manav', 22, 'Surat', 60);

