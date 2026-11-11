USE mini_ecommerce;
-- Q1 ACTIVE CATALOG AND CATEGORY SEARCH
SET @category_id=1; SET @search='';
SELECT p.product_id,p.sku,p.name,c.name AS category,p.price,p.stock_qty
FROM products p JOIN categories c ON c.category_id=p.category_id
WHERE p.is_active=1 AND (@category_id IS NULL OR p.category_id=@category_id)
AND (@search='' OR p.name LIKE CONCAT(@search,'%')) ORDER BY p.name;



-- Q2 CUSTOMER ORDER HISTORY
SET @customer_email='amina@example.com';
SELECT o.order_id,o.order_date,o.status,o.total_amount
FROM customers c JOIN orders o ON o.customer_id=c.customer_id
WHERE c.email=@customer_email ORDER BY o.order_date DESC;
