--SET search_path TO public

/* Udemy ZTM SQL Exercises*/

SELECT AVG(salary) FROM "salaries";
SELECT MAX(birth_date) FROM "publ4ic"."employees";
SELECT count(id) FROM "towns";
SELECT COUNT(countrycode) FROM "countrylanguage" WHERE isofficial = TRUE;
SELECT AVG(lifeexpectancy) FROM country;
SELECT AVG(population) FROM "public"."city" WHERE countrycode = 'NLD';

/* select statement to filter Mayumi Schueller*/

SELECT first_name, last_name FROM "public"."employees"
/*
filter on the first name AND last name to limit the amount of data
and focus  the filtering on a single person
*/
WHERE first_name = 'Mayumi' AND last_name = 'Schueller'; --filter here on Mayumi Schueller
 
 /*get a list of all female employees*/
 
 SELECT first_name, last_name FROM employees
 WHERE gender = 'F';
 
 -- Understanding filtering using AND and OR
 
 -- When we do a where clause, there is an order of operation -> an order WHERE is going to at the criteria
 -- the AND keyword chain together to multiple criteria of the filter
 -- so when we want to filter out a specific group all the AND's will be chain together'
 -- the moment the WHERE clause find's an OR it's going to start a new filter -> a potentially set of different information that can also be matched

SELECT  first_name, last_name, hire_date FROM employees
WHERE (first_name = 'Georgi' AND last_name = 'Facello' AND hire_date = '1986-06-26')
OR (first_name = 'Bezalel' AND last_name = 'Simmel');
 
 -- How many female customers do we have from the state of Oregon (OR) and New York (NY)
 SELECT COUNT(customerid) FROM "public"."customers" WHERE gender = 'F' AND (state = 'OR' OR state = 'NY');
 
 -- The NOT Keyword
 /* How manny customer are'nt 55 */
 SELECT COUNT(age) FROM "public"."customers" WHERE NOT age = 55;
 

