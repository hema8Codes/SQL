/*

DISTINCT Keyword

-> Remove Duplicates

Distinct clause keeps one row for each group of duplicates

SELECT
   DISTINCT <col1>, <col2>
FROM
   <table>

Multiple Columns will evaluate based on the combination of columns 

*/

--SELECT DISTINCT salary, from_date FROM salaries;

/*
* DB: Employees
* Table: titles
* Question: What unique titles do we have?
*/

SELECT DISTINCT title FROM titles;

/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/

SELECT COUNT(DISTINCT birth_date) FROM employees;

/*
* DB: World
* Table: country
* Question: Can I get a list of distinct life expectancy ages
* Make sure there are no nulls
*/

SELECT DISTINCT lifeexpectancy FROM country WHERE lifeexpectancy IS NOT NULL ORDER BY lifeexpectancy;