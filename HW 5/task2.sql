-- 1. Total income of the restaurant
SELECT SUM(total) AS Income FROM Bills;

-- 2. Income for February 2016
SELECT SUM(total) AS 'Feb Income' FROM Bills WHERE DATE_FORMAT(date, '%Y-%m') = '2016-02';

-- 3. Average bill in table 2
SELECT AVG(total) AS Avg_Bill FROM Bills WHERE table_id = 2;

-- 4. Min, Max, and Avg seats of tables in Blue room
SELECT MIN(seats) AS Min, MAX(seats) AS Max, AVG(seats) AS Avg FROM Tables WHERE room_name = 'Blue';

-- 5. Count of distinct tables served by waiters 004 and 002
SELECT COUNT(DISTINCT table_id) AS Distinct_Tables FROM Bills WHERE waiter_id IN ('004', '002');
