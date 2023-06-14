/*

IN Keyword

-> Check if a value matches any value in a list of values

*/

/*
* DB: Store
* Table: orders
* Question: How many orders were made by customer 7888, 1082, 12808, 9623
*/

SELECT COUNT(orderid) FROM orders WHERE customerid IN (7888, 1082, 12808, 9623);

/*
* DB: World
* Table: city
* Question: How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
*/

SELECT COUNT(id) FROM city WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht')

/*
 PARTIAL LOOKUPS 
 ->  What if you don't know hat you are looking for
 LIKE Keyword
 
 SELECT first_name FROM employees WHERE first_name LIKE 'M%';
 -> get everyone who's name start with 'M'
 
 PATTERN MATCHING
 -> In order to  like you need to build patterns to match!
 Pattern wildcards
 %  -> Any number of characters
 _ -> 1 character
 LIKE '2%' ->  Fields that start with 2
 LIKE '%2' ->  Fields that end with 2
 LIKE '%2%' -> Fields that have 2 anywhere in the value
 LIKE '_00%' -> Fields that have 2 zero's as the second and third character and anything after that
 LIKE '%200%' -> Fields that have 200 anywhere in the value
 LIKE '2_%_%' -> Finds any values that start with 2 and are at least 3 characters in length
 LIKE '2___3' -> Finds any values in a five-digit number that start with 2 and end with 3
 
 * POSTGRES LIKE ONLY DOES TEXT COMPARISON SO WE MUST CAST WHATEVER WE USE TO TEXT
 
 CASTING TO TEXT
  
 CAST(salary AS text);
 salary::text
 
 -> ILIKE Keyword ---- CASE INSENSITIVE MATCHING
 name ILIKE 'MO%';
 
*/ 

/*
* DB: Employees
* Table: employees
* Question: Find the age of all employees who's name starts with M.
* Sample output: https://imgur.com/vXs4093
* Use EXTRACT (YEAR FROM AGE(birth_date)) we will learn about this in later parts of the course
*/

SELECT emp_no, first_name, EXTRACT (YEAR FROM AGE(birth_date)) AS "age" FROM employees WHERE first_name LIKE 'M%' ;

/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/

SELECT COUNT(emp_no) FROM "public"."employees" WHERE first_name ILIKE 'A%R';

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/

SELECT COUNT(customerid) FROM "public"."customers" WHERE zip::TEXT LIKE '%2%';

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/

SELECT COUNT(customerid) FROM "public"."customers" WHERE zip::TEXT LIKE '2_1%';

/*
* DB: Store
* Table: customers
* Question: Which states have phone numbers starting with 302?
* Replace null values with "No State"                                                  
* Expected output: https://imgur.com/AVe6G4c
*/

SELECT COALESCE(state, 'No State') AS "State" FROM "public"."customers" WHERE phone::TEXT LIKE '302%'; 


