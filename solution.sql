-- Name: Sadeel Fayez Alassaf
-- Uni_ID: 202311159
-- Course: Database Programming
-- Homework (1)

Q1-1:Find the total number 
of orders placed by each customer:

SELECT customer_id, Count (order_id) As total_orders
FROM Orders
Group By customer_id;

Q1-2:Retrieve customers who have placed more orders 
than the average number of orders per
customer:

SELECT customer_id, Count (order_id) As total_orders
FROM Orders
Group By customer_id
HAVING Count (order_id) > (
   SELECT AVG(order_count)
    FROM (
        SELECT Count (order_id) As order_count
        FROM Orders
        Group By customer_id
    ) As sub
);

Q1-3:Create an index on the customer_id 
  column in the Orders table:

CREATE INDEX idx_customer_id
On Orders(customer_id);

Q1-4: Write a transaction:
  
BEGIN;
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES (1, 101, '2026-04-10', 200.00);
INSERT INTO Order_Items (item_id, order_id, product_name, quantity, price)
VALUES (1, 1, 'Laptop', 1, 200.00);
-- errors
ROLLBACK;
-- correct
COMMIT;

Q1-5:Explain: What ACID properties are?
1) Atomicity
2) Consistency
3) Isolation
4) Durability

Q2: Cumulative Sum:
SELECT 
   qty,
   SUM(qty) OVER (Order By qty) As cumulative_sum
FROM demand;
