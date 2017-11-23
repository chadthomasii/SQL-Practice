-- IMPLICIT INNER JOIN

SELECT first_name, last_name, order_date, amount 
FROM customers, orders 
    WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN

SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;


-- Get The total amount spent for each person

SELECT first_name, last_name, order_date, SUM(amount) AS TotalSpent
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY orders.customer_id 
ORDER BY TotalSpent;

-- LEFT JOIN
SELECT first_name, last_name, order_date, amount 
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
ORDER BY orders.amount;