-- 1. List the names of the waiters who have served the customer Tanya Singh.
SELECT DISTINCT w.first_name, w.last_name
FROM waiters w
JOIN bills b ON w.waiter_id = b.waiter_id
JOIN customers c ON b.customer_id = c.customer_id
WHERE c.name = 'Tanya Singh';

-- 2. On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room?
SELECT DISTINCT b.bill_date
FROM bills b
JOIN rooms r ON b.room_id = r.room_id
JOIN headwaiters h ON r.headwaiter_id = h.headwaiter_id
WHERE h.name = 'Charles' AND r.name = 'Green'
  AND b.bill_date LIKE '2016-02%';

-- 3. List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
SELECT DISTINCT w.first_name, w.last_name
FROM waiters w
JOIN rooms r ON w.room_id = r.room_id
WHERE r.headwaiter_id = (
    SELECT r.headwaiter_id
    FROM waiters w
    JOIN rooms r ON w.room_id = r.room_id
    WHERE w.first_name = 'Zoe' AND w.last_name = 'Ball'
);

-- 4. List the customer name, the amount they spent, and the waiter’s name for all bills. Order by highest bill first.
SELECT c.name AS customer_name, b.amount AS amount_spent, 
       CONCAT(w.first_name, ' ', w.last_name) AS waiter_name
FROM bills b
JOIN customers c ON b.customer_id = c.customer_id
JOIN waiters w ON b.waiter_id = w.waiter_id
ORDER BY b.amount DESC;

-- 5. List the names and surnames of the waiters who serve tables in the same team that served bills 00014 and 00017.
SELECT DISTINCT w.first_name, w.last_name
FROM waiters w
JOIN bills b ON w.waiter_id = b.waiter_id
WHERE b.team_id IN (
    SELECT DISTINCT team_id
    FROM bills
    WHERE bill_number IN ('00014', '00017')
);

-- 6. List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312.
SELECT DISTINCT w.first_name, w.last_name
FROM waiters w
JOIN rooms r ON w.room_id = r.room_id
WHERE r.name = 'Blue' AND r.room_date = '160312'
UNION
SELECT h.first_name, h.last_name
FROM headwaiters h
JOIN rooms r ON h.headwaiter_id = r.headwaiter_id
WHERE r.name = 'Blue' AND r.room_date = '160312';
