/*
ORDER BY 

-> Sort data either ascending or descending by column

SELECT * FROM CUSTOMERS ORDER BY <column> [ASC/DESC]

EX 1 -> SELECT * FROM customers ORDER BY name ASC
EX 2 -> SELECT * FROM customers ORDER BY name DESC

 sorting based on multiple column
 
 SELECT * FROM customers ORDER BY name, lastName DESC
 
 -> This will yield the results, name will be sorted by ascending and lastName will be sorted by descending 
 
 SELECT * FROM customers ORDER BY name DESC, lastName DESC
 
  -> This will yield the results, name will be sorted by descending and lastName will be sorted by descending

 sorting based on using other expressions
 
 SELECT * FROM customers ORDER BY LENGTH(name)
 
 SELECT first_name, last_name FROM employees order by LENGTH(first_name) desc;
*/

/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/

 SELECT * FROM employees ORDER BY first_name ASC, last_name DESC;
 
 /*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/

SELECT * FROM employees ORDER BY birth_date;

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/

SELECT * FROM employees WHERE first_name LIKE 'K%' ORDER BY hire_date;