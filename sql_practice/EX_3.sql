/*
1. OPERATOR PRECEDENCE

Parenthesis -> Multiplication/Division -> Subtraction/Addition -> NOT -> AND -> OR

2. ORDER and PRIORITY

3. DIRECTION

If the operators have equal precedence, then the operators are evaluated directionally, from left to right or right to left.

Operator precedence an extremely important and vital concept to applying filters to your query. It is also an extremely complex chain of operations to follow at times.
Always remember the following: HIGHEST to LOWEST

1. Parenthesis

2. Arithmetic Operators

3. Concatenation Operators

4. Comparison Conditions

5. IS NULL, LIKE, NOT IN, etc.

6. NOT

7. AND

8. OR
*/


/*
* DB: Store
* Table: Customers
* Question: 
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia
*/

SELECT firstname, lastname, age, income, country FROM "public"."customers" WHERE income > 50000 AND (age < 30 OR age >= 50) AND (country = 'Japan' OR country = 'Australia');

/*
* DB: Store
* Table: Orders
* Question: 
* What was our total sales in June of 2004 for orders over 100 dollars?
*/

SELECT SUM(totalamount) FROM "public"."orders" WHERE (orderdate >= '2004-06-01' AND orderdate <= '2004-06-30') AND totalamount > 100; 

