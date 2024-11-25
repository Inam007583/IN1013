-- 1. Which waiters have taken 2 or more bills on a single date? 
-- List the waiter names and surnames, the dates, and the number of bills they have taken.
SELECT w.first_name, w.last_name, b.bill_date, COUNT(*) AS bill_count
FROM waiters w
JOIN bills b ON w.waiter_id = b.waiter_id
GROUP BY w.first_name, w.last_name, b.bill_date
HAVING COUNT(*) >= 2;

-- 2. List the rooms with tables that can serve more than 6 people and how many of such tables they have.
SELECT r.name AS room_name, COUNT(*) AS table_count
FROM rooms r
JOIN tables t ON r.room_id = t.room_id
WHERE t.capacity > 6
GROUP BY r.name;

-- 3. List the names of the rooms and the total amount of bills in each room.
SELECT r.name AS room_name, SUM(b.amount) AS total_bill_amount
FROM rooms r
JOIN bills b ON r.room_id = b.room_id
GROUP BY r.name;

-- 4. List the headwaiter’s name and surname and the total bill amount their waiters have taken. 
-- Order the list by total bill amount, largest first.
SELECT h.first_name, h.last_name, SUM(b.amount) AS total_bill_amount
FROM headwaiters h
JOIN rooms r ON h.headwaiter_id = r.headwaiter_id
JOIN bills b ON r.room_id = b.room_id
GROUP BY h.first_name, h.last_name
ORDER BY total_bill_amount DESC;

-- 5. List any customers who have spent more than £400 on average.
SELECT c.name AS customer_name, AVG(b.amount) AS average_spent
FROM customers c
JOIN bills b ON c.customer_id = b.customer_id
GROUP BY c.name
HAVING AVG(b.amount) > 400;

-- 6. Which waiters have taken 3 or more bills on a single date? 
-- List the waiter names, surnames, and the number of bills they have taken.
SELECT w.first_name, w.last_name, b.bill_date, COUNT(*) AS bill_count
FROM waiters w
JOIN bills b ON w.waiter_id = b.waiter_id
GROUP BY w.first_name, w.last_name, b.bill_date
HAVING COUNT(*) >= 3;
