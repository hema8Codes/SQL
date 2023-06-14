/* #3 Valued Logic

 * Besides True and False the results of the logical expressions can also be unknown
 * The SQL NULL Value "COULD BE ANYTHING"
 * Nothing Equals NULL , Not Even NULL, Each NULL could be different
 * That's why we use "IS NULL" to check
 
 Eg -> (NULL = 1) OR (1 = 1)  --> NULL OR TRUE  --> TRUE
 Eg 2 -> (NULL = 1) AND (0 = 1) --> NULL OR FALSE --> NULL -> There is no result set
 
 * NULL is always unknown
 Eg 3 -> SELECT <column> FROM <table> WHERE <column> = NULL  --> returns NULL
 * IS NULL checks for unknowns
 Eg 4 -> SELECT <column> FROM <table> WHERE <column> IS NULL --> return true
 * Strange Scenarios
 Eg 5 -> SELECT <column> FROM <table> WHERE (<column> = NULL) OR (NOT <column> = NULL) -> nothing is going to be returned , it is NULL
 * Another Strange Scenario
 Eg 6 -> SELECT <column> FROM <table> WHERE (<column> IS NULL) OR (<column> IS NOT NULL)
*/

/*
* DB: Store
* Table: customers
* Question: adjust the following query to display the null values as "No Address"
*/
SELECT COALESCE(address2, 'No Address') FROM customers

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/
SELECT * FROM customers WHERE address2 IS NOT NULL

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/

SELECT COALESCE(lastName, 'Empty'), * FROM customers WHERE (age IS NULL);

/* 
    BETWEEN AND

    SELECT <column> FROM <table> WHERE <column> BETWEEN X and Y
    
    BETWEEN AND is sensitive to the order of arguments
*/
-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)

SELECT * FROM "public"."customers" WHERE age BETWEEN 30 AND 50 AND income < 50000 

-- What is the average income between the ages of 20 and 50? (Including 20 and 50)

SELECT AVG(income) FROM "public"."customers" WHERE age BETWEEN 20 AND 50


