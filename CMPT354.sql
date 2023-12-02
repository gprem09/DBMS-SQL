CREATE DATABASE department_store;
USE department_store;

-- Task 1
CREATE TABLE Employee (
    eid INT PRIMARY KEY,
    name CHAR(20),
    salary INT CHECK (salary BETWEEN 5000 AND 20000),
    dept CHAR(20)
);

CREATE TABLE Sales (
    dept CHAR(20),
    item CHAR(20),
    PRIMARY KEY (dept, item)
);

CREATE TABLE Types (
    item CHAR(20),
    color CHAR(20),
    PRIMARY KEY (item, color)
);

-- Task 2
INSERT INTO Employee (eid, name, salary, dept) VALUES
(111, 'Jane', 8000, 'Household'),
(222, 'Anderson', 8000, 'Toy'),
(333, 'Morgan', 10000, 'Cosmetics'),
(444, 'Lewis', 12000, 'Stationery'),
(555, 'Nelson', 6000, 'Toy'),
(666, 'Hoffman', 16000, 'Cosmetics'); 

INSERT INTO Sales (dept, item) VALUES
('Stationery','pen'),
('Cosmetics','lipstick'),
('Toy','puzzle'),
('Stationery','ink'),
('Household','disk'),
('Sports','skates'),
('Toy','lipstick');

INSERT INTO Types (item, color) VALUES 
('pen','red'),
('lipstick','red'),
('pen','black'),
('puzzle','black'),
('ink','red'),
('ink','blue');

-- Task 3
-- 3.1
SELECT e.dept, MAX(e.salary) AS MaxSalary
FROM Employee e
WHERE e.dept IN (
        SELECT s.dept
        FROM Sales s
        GROUP BY s.dept
        HAVING COUNT(DISTINCT s.item) >= 2 )
GROUP BY e.dept;

-- Task 3
-- 3.2
SELECT e.name FROM Employee e
WHERE e.dept IN (
        SELECT s.dept
        FROM Sales s
        WHERE s.item IN (
                SELECT t.item
                FROM Types t
                WHERE t.color = 'black' ));

-- Task 3
-- 3.3
SELECT e.dept, AVG(e.salary) AS AvgSalary
FROM Employee e
WHERE e.dept <> 'Stationery'
GROUP BY e.dept
HAVING AVG(e.salary) > (
        SELECT AVG(e2.salary) 
        FROM Employee e2
        WHERE e2.dept = 'Stationery');

-- Task 3
-- 3.4
SELECT COUNT(*) AS NumberOfDepartments
FROM (SELECT dept
     FROM Employee
     GROUP BY dept
     HAVING AVG(salary) < (SELECT AVG(salary) 
     FROM Employee WHERE dept = 'Stationery')) AS SubQuery;

-- Task 3
-- 3.5
SELECT dept FROM Employee
GROUP BY dept
HAVING MIN(salary) >= 7000;

-- Task 3
-- 3.6
SELECT s1.dept FROM Sales s1
WHERE NOT EXISTS (
        SELECT s2.item
        FROM Sales s2
        WHERE s2.dept = 'Cosmetics'
        AND NOT EXISTS (
                SELECT *
                FROM Sales s3
                WHERE s3.dept = s1.dept AND s3.item = s2.item
            ) )
GROUP BY s1.dept
HAVING s1.dept <> 'Cosmetics';