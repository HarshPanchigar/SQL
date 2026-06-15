use rev;
CREATE Table emp(
    id INT,
    salary INT DEFAULT 20000);

INSERT INTO emp (id)VALUES (101);
INSERT INTO emp VALUES (102,50000);

SELECT * FROM emp;