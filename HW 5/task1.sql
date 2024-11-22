-- 1. Dates and bill totals for customer Bob Crow
SELECT b.date, b.total FROM Bills b JOIN Customers c ON b.customer_id = c.customer_id WHERE c.first_name = 'Bob' AND c.last_name = 'Crow';

-- 2. Names of all customers whose last name is Smith in reverse lexicographical order
SELECT DISTINCT CONCAT(c.first_name, ' ', c.last_name) AS full_name FROM Customers c WHERE c.last_name = 'Smith' ORDER BY c.first_name DESC;

-- 3. Names of all customers whose second names begin with 'C'
SELECT DISTINCT CONCAT(c.first_name, ' ', c.last_name) AS full_name FROM Customers c WHERE c.last_name LIKE 'C%';

-- 4. Names of all the headwaiters
SELECT e.name FROM Employees e WHERE e.job_title = 'Headwaiter';

-- 5. All details of bills dated February 2016
SELECT * FROM Bills WHERE DATE_FORMAT(date, '%Y-%m') = '2016-02';

-- 6. Dates the restaurant took money in 2015, sorted
SELECT DISTINCT DATE(date) AS transaction_date FROM Bills WHERE YEAR(date) = 2015 ORDER BY transaction_date;
