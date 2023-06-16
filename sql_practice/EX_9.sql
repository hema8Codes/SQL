/*
    MULTI TABLE SELECT
    COMBINING DATA
    -> What if you want to combine from data from multiple tables
    
    HOW ? 
    -> by using an alias
    -> linking primary and foreign keys
    
    WHAT DID WE DO?
    We joined 2 Datasets
    
    JOINS
    
   -> A join combines columns from one table with those of another.
   -> Take a column from on table that can map to the column of another table
   -> Most common approach? link primary to foreign key
    
    
    
*/

-- The statement below is not considered as the best practice
--SELECT  a.emp_no, CONCAT(a.first_name, ' ',a.last_name) as "name", b.salary, b.from_date from "public"."employees" as a, "public"."salaries" as b WHERE a.emp_no = b.emp_no ORDER BY a.emp_no;

/* 
INNER JOINS
if you have columns that links the column from table A to table B you can use an inner join
*/

--The best practice
--SELECT a.emp_no, CONCAT(a.first_name, ' ',a.last_name) as "name", b.salary FROM employees as a inner JOIN salaries as b ON b.emp_no = a.emp_no;

/* 
The inner join syntax is generally considered a best practice it's  more
readable that using the WHERE syntax it shows you what's being joined
it's great!

BUT the result always comeback unsorted
*/

--SELECT a.emp_no, CONCAT(a.first_name, ' ',a.last_name) as "name", b.salary FROM employees as a inner JOIN salaries as b ON b.emp_no = a.emp_no ORDER BY a.emp_no AS;

/* 
Here's the curveball -> what if we only want to know the raises from the promotion
Table A (employees) <- Table B (salary) <- Table C (titles)
-> also title change always follow 2 days after the raise 
*/

-- SElect a.emp_no, b.salary, b.from_date, c.title 
-- FROM employees AS a 
-- INNER JOIN salaries as b on b.emp_no = a.emp_no 
-- INNER JOIN titles as c ON c.emp_no = a.emp_no and  c.from_date = (b.from_date + INTERVAL '2 days' )
-- ORDER by a.emp_no ASC, b.from_date ASC;

-- PROBLEM -> What if you want to know the original salary and also know the salary at promotion

SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.salary, COALESCE(c.title, 'No title change'), COALESCE(c.from_date::TEXT, '-') AS "title taken on" 
FROM employees AS a 
INNER JOIN salaries AS b ON b.emp_no = a.emp_no 
INNER JOIN titles AS c ON c.emp_no = a.emp_no AND ( c.from_date = (b.from_date + INTERVAL '2 days') OR c.from_date = b.from_date   )
ORDER BY a.emp_no ASC, b.from_date ASC;




