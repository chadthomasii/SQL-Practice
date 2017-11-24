-- IMPLICIT INNER JOIN

SELECT first_name, last_name, order_date, amount 
FROM customers, orders 
    WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN

SELECT first_name, last_name, order_date, amount 
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;


-- Get The total amount spent for each person

SELECT first_name, last_name, order_date, SUM(amount) AS TotalSpent
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY orders.customer_id 
ORDER BY TotalSpent;

-- LEFT JOIN
SELECT first_name, last_name, IFNULL(order_date, 'N/A') AS order_date, IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id 
ORDER BY total_spent;

-- RIGHT JOIN
SELECT *
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id 
ORDER BY total_spent;

-- ON DELETE CASCADE

CREATE TABLE customers
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT, 
    FOREIGN KEY(customer_id) REFERENCES customers(id)
    ON DELETE CASCADE 
);