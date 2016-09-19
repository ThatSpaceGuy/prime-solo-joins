-- 0. Get all the users
SELECT * FROM customers;

-- 1. Get all customers and their addresses.
SELECT first_name, last_name, address_type, street, city, state, zip FROM customers JOIN addresses ON customers.id = addresses.customer_id;
-- 2. Get all orders and their line items.
SELECT orders.id as order_id, order_date, product_id, unit_price, quantity, total FROM orders LEFT JOIN line_items ON orders.id = line_items.order_id;
-- 3. Which warehouses have cheetos?
SELECT warehouse, description, on_hand FROM warehouse JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id JOIN products ON warehouse_product.product_id=products.id WHERE description = 'cheetos';
-- 4. Which warehouses have diet pepsi?
SELECT warehouse, description, on_hand FROM warehouse JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id JOIN products ON warehouse_product.product_id=products.id WHERE description = 'diet pepsi';
-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT first_name, last_name, COUNT(customer_id) AS NumberOfOrders FROM customers JOIN addresses ON customers.id = addresses.customer_id JOIN orders ON addresses.id = orders.address_id GROUP BY first_name, last_name;
-- 6. How many customers do we have?
SELECT COUNT(id) AS NumberOfCustomers from customers;
-- 7. How many products do we carry?
SELECT COUNT(id) AS NumberOfProducts from products;
-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT description, SUM(on_hand) AS TotalAvailable FROM warehouse_product JOIN products ON warehouse_product.product_id=products.id WHERE description = 'diet pepsi' GROUP BY description;
