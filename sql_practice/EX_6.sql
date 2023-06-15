/*
    Date Filtering
    -> GMT is a Timezone
    -> UTC is a Timestandard
    -> They share the same current
    "ALWAYS" USE UTC
    SET TIME ZONE 'UTC'
*/
--SHOW timezone;

--ALTER USER postgres SET timezone = 'UTC';

--SHOW TIMEZONE;

/*
MANIPULATING DATES
How do we format Date and time?
How DO DATES LOOK
POSTGRESQL USES ISO-8601

YYYY-MM-DDTHH:MM:SS
2017-08-17T12:47:16+02:00

What is a Format?
-> A format is a way of representing a date and time
TIMESTAMPS
-> A timestamp is a date with time and timezome info
*/


-- CREATE TABLE timezones(
--     ts TIMESTAMP WITHOUT TIME ZONE,
--     tz TIMESTAMP WITH TIME ZONE
-- )

-- INSERT into timezones VALUES(
--     timestamp WITHOUT TIME ZONE '2000-01-01 10:00:00-05',
--     TIMESTAMP WITH TIME ZONE '2000-01-01 10:00:00-05'
-- )

--SELECT * FROM "public"."timezones";

/*
Should I store timestamps or dates?

It depends on what you are storing
*/

/*
DATE OPERATORS

POSTGRES GIVES US OPERATORS TO HELP SIMPLIFY DATES

Date Functions

Current Date
SELECT NOW()::date;
SELECT CURRENT_DATE;

*/

--SELECT NOW()::date;
--SELECT CURRENT_DATE;

--SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/yyyy')

/*
Date difference and casting

--SELECT  NOW() - '1800/01/01' 
DIFFERENCE - Subtracting dates returns the difference in days

TO DATE - Converts a date to a date format for postgres
SELECT date '1800/01/01'
*/

/*
AGE CALCULATION

-> Calculate age
SELECT AGE(date '1800-01-01')

-> Calculate age between
SELECT AGE(date '1998/12/08', date '1800/01/01')
*/

/*
Extracting information

EXTRACT DAY
SELECT  EXTRACT (DAY FROM date '1998/12/08') AS DAY

EXTRACT MONTH
SELECT EXTRACT (MONTH FROM date '1998/12/08') AS MONTH

EXTRACT YEAR
SELECT EXTRACT (YEAR FROM date '1998/12/08') AS YEAR

Round a Date

SELECT DATE_TRUNC('year', date '1998/12/08')  
-- it will set month and date to the lowest possible value

SELECT DATE_TRUNC('month', date '1998/12/08') 
-- it will round down the day to lowest possible value

SELECT DATE_TRUNC('day', date '1998/12/08') 
-- it will not do anything but in case of timestamp, it will set all of the timestamp to zero

Interval
-> Interval allows us to write queries in a way that mirrors language
ADJUSTING INTERVALS
-> It can store and manipulate a period of time in years, months, days, hours, minutes, seconds etc
-> Identifiers
  - Years
  - Months
  - Days
  - Hours
  - Minutes
    
    INTERVAL '1 year 2 months 3 days'
    INTERVAL '2 weeks ago'
    INTERVAL '1 year 3 hours 20 minutes'

SELECT * FROM "public"."orders" WHERE orderdate <= now() - interval '30 days'
-- day <30 days before given date>

EXTRACTING in the interval?
SELECT EXTRACT(year FROM INTERVAL '5 years 20 months')

*/

/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT AGE(birth_date), * FROM employees WHERE (EXTRACT (YEAR FROM AGE(birth_date)) > 60); 

-- alternative
--SELECT count(birth_date) FROM employees WHERE birth_date < now() - INTERVAL '61 years' ;
-- 61 years before the current date

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

SELECT  COUNT(emp_no) FROM employees WHERE EXTRACT (MONTH FROM hire_date) = 2;

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT COUNT(emp_no) FROM employees WHERE EXTRACT (MONTH FROM birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT  MAX(AGE(birth_date)) FROM employees;

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT COUNT(orderid) FROM orders WHERE (EXTRACT (MONTH FROM orderdate) = 1) AND (EXTRACT (YEAR FROM orderdate) = 2004);

-- alternative
--SELECT COUNT(orderid) FROM orders WHERE DATE_TRUNC('month', orderdate) = date '2004-01-01';







