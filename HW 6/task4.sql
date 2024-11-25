

-- 1. List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.
SELECT DISTINCT c.name AS customer_name
FROM customers c
JOIN bills b ON c.customer_id = b.customer_id
JOIN rooms r ON b.room_id = r.room_id
JOIN headwaiters h ON r.headwaiter_id = h.headwaiter_id
WHERE b.amount > 450.00 AND h.name = 'Charles';

-- 2. A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016.
-- What is the name and surname of the Headwaiter who will have to deal with the matter?
SELECT h.first_name, h.last_name
FROM headwaiters h
JOIN rooms r ON h.headwaiter_id = r.headwaiter_id
JOIN bills b ON r.room_id = b.room_id
JOIN customers c ON b.customer_id = c.customer_id
WHERE c.name = 'Nerida' AND b.bill_date = '2016-01-11';

-- 3. What are the names of customers with the smallest bill?
SELECT c.name AS customer_name
FROM customers c
JOIN bills b ON c.customer_id = b.customer_id
WHERE b.amount = (SELECT MIN(amount) FROM bills);

-- 4. List the names of any waiters who have not taken any bills.
SELECT w.first_name, w.last_name
FROM waiters w
WHERE NOT EXISTS (
    SELECT 1
    FROM bills b
    WHERE b.waiter_id = w.waiter_id
);

-- 5. Which customers had the largest single bill?
-- List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.
SELECT c.name AS customer_name, h.first_name AS headwaiter_first_name, 
       h.last_name AS headwaiter_last_name, r.name AS room_name
FROM customers c
JOIN bills b ON c.customer_id = b.customer_id
JOIN rooms r ON b.room_id = r.room_id
JOIN headwaiters h ON r.headwaiter_id = h.headwaiter_id
WHERE b.amount = (SELECT MAX(amount) FROM bills);
