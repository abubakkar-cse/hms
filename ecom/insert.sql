-- Run once after 01 and 02. IDs and amounts are deterministic; dates are relative to run date.
-- INSERT INTO categories(category_id,title,description) VALUES
-- (1,'Electronics','Gadgets and computer accessories'),(2,'Clothing','Everyday apparel'),
-- (3,'Books','Books and stationery'),(4,'Accessories','Daily-use accessories'),(5,'Home','Home essentials');

-- INSERT INTO products(product_id,category_id,sku,name,description,price,stock_qty,image_url,is_active) VALUES
-- (1,1,'EL-001','USB-C Cable','Durable charging cable',250,60,NULL,1),
-- (2,1,'EL-002','Wireless Mouse','Ergonomic mouse',750,60,NULL,1),
-- (3,1,'EL-003','Bluetooth Speaker','Portable speaker',2200,60,NULL,1),
-- (4,1,'EL-004','Phone Stand','Adjustable desk stand',320,60,NULL,1),
-- (5,2,'CL-001','Cotton T-Shirt','Unisex cotton tee',550,60,NULL,1),
-- (6,2,'CL-002','Polo Shirt','Classic polo',950,60,NULL,1),
-- (7,2,'CL-003','Casual Cap','Cotton cap',400,60,NULL,1),
-- (8,2,'CL-004','Canvas Tote Bag','Reusable tote',450,60,NULL,1),
-- (9,3,'BK-001','Programming Basics','Beginner coding guide',650,60,NULL,1),
-- (10,3,'BK-002','Graph Notebook','A4 notebook',150,60,NULL,1),
-- (11,3,'BK-003','Exam Planner','Study planner',280,60,NULL,1),
-- (12,3,'BK-004','Pocket Dictionary','English-Bangla words',380,60,NULL,1),
-- (13,4,'AC-001','Leather Wallet','Minimal wallet',850,60,NULL,1),
-- (14,4,'AC-002','Key Ring','Metal key ring',120,60,NULL,1),
-- (15,4,'AC-003','Sunglasses','UV protection',1200,60,NULL,1),
-- (16,4,'AC-004','Travel Pouch','Zipper pouch',550,60,NULL,1),
-- (17,5,'HM-001','Water Bottle','Reusable steel bottle',600,60,NULL,1),
-- (18,5,'HM-002','Desk Lamp','LED desk light',1450,60,NULL,1),
-- (19,5,'HM-003','Coffee Mug','Ceramic mug',350,4,NULL,1),
-- (20,5,'HM-004','Storage Basket','Multipurpose basket',500,0,NULL,1);

   insert INTO customers(customer_id,full_name,email,phone,shipping_address) VALUES
(1,'Amina Rahman','amina@example.com','01000000001','Dhanmondi, Dhaka'),
(2,'Tanvir Hasan','tanvir@example.com','01000000002','Mirpur, Dhaka'),
(3,'Nusrat Jahan','nusrat@example.com','01000000003','Agrabad, Chattogram'),
(4,'Rafi Ahmed','rafi@example.com','01000000004','Sonadanga, Khulna'),
(5,'Sadia Islam','sadia@example.com','01000000005','Rajshahi City'),
(6,'Fahim Hossain','fahim@example.com','01000000006','Sylhet Sadar'),
(7,'Maliha Akter','maliha@example.com','01000000007','Barishal Sadar'),
(8,'Sakib Khan','sakib@example.com','01000000008','Rangpur City'),
(9,'Tania Sultana','tania@example.com','01000000009','Cumilla Sadar'),
(10,'Imran Kabir','imran@example.com','01000000010','Uttara, Dhaka');

INSERT INTO orders(order_id,customer_id,order_date,status,total_amount,cancelled_at) VALUES
(1,1,DATE_SUB(NOW(), INTERVAL 3 DAY),'delivered',0,NULL),
(2,2,DATE_SUB(NOW(), INTERVAL 6 DAY),'delivered',0,NULL),
(3,3,DATE_SUB(NOW(), INTERVAL 9 DAY),'confirmed',0,NULL),
(4,4,DATE_SUB(NOW(), INTERVAL 12 DAY),'shipped',0,NULL),
(5,5,DATE_SUB(NOW(), INTERVAL 15 DAY),'placed',0,NULL),
(6,6,DATE_SUB(NOW(), INTERVAL 18 DAY),'cancelled',0,DATE_SUB(NOW(), INTERVAL 18 DAY)),
(7,7,DATE_SUB(NOW(), INTERVAL 21 DAY),'delivered',0,NULL),
(8,8,DATE_SUB(NOW(), INTERVAL 24 DAY),'confirmed',0,NULL),
(9,9,DATE_SUB(NOW(), INTERVAL 27 DAY),'delivered',0,NULL),
(10,10,DATE_SUB(NOW(), INTERVAL 1 DAY),'placed',0,NULL),
(11,1,DATE_SUB(NOW(), INTERVAL 4 DAY),'delivered',0,NULL),
(12,2,DATE_SUB(NOW(), INTERVAL 7 DAY),'delivered',0,NULL),
(13,3,DATE_SUB(NOW(), INTERVAL 10 DAY),'confirmed',0,NULL),
(14,4,DATE_SUB(NOW(), INTERVAL 13 DAY),'shipped',0,NULL),
(15,5,DATE_SUB(NOW(), INTERVAL 16 DAY),'placed',0,NULL),
(16,6,DATE_SUB(NOW(), INTERVAL 19 DAY),'cancelled',0,DATE_SUB(NOW(), INTERVAL 19 DAY)),
(17,7,DATE_SUB(NOW(), INTERVAL 22 DAY),'delivered',0,NULL),
(18,8,DATE_SUB(NOW(), INTERVAL 25 DAY),'confirmed',0,NULL),
(19,9,DATE_SUB(NOW(), INTERVAL 28 DAY),'delivered',0,NULL),
(20,10,DATE_SUB(NOW(), INTERVAL 2 DAY),'placed',0,NULL),
(21,1,DATE_SUB(NOW(), INTERVAL 5 DAY),'delivered',0,NULL),
(22,2,DATE_SUB(NOW(), INTERVAL 8 DAY),'delivered',0,NULL),
(23,3,DATE_SUB(NOW(), INTERVAL 11 DAY),'confirmed',0,NULL),
(24,4,DATE_SUB(NOW(), INTERVAL 14 DAY),'shipped',0,NULL),
(25,5,DATE_SUB(NOW(), INTERVAL 17 DAY),'placed',0,NULL);

INSERT INTO order_items(order_id,product_id,quantity,unit_price,line_total)
SELECT v.order_id,v.product_id,v.quantity,p.price,v.quantity*p.price FROM (
SELECT 1 AS order_id, 4 AS product_id, 2 AS quantity
UNION ALL
SELECT 1 AS order_id, 11 AS product_id, 3 AS quantity
UNION ALL
SELECT 2 AS order_id, 7 AS product_id, 3 AS quantity
UNION ALL
SELECT 2 AS order_id, 14 AS product_id, 1 AS quantity
UNION ALL
SELECT 3 AS order_id, 10 AS product_id, 1 AS quantity
UNION ALL
SELECT 3 AS order_id, 17 AS product_id, 2 AS quantity
UNION ALL
SELECT 4 AS order_id, 13 AS product_id, 2 AS quantity
UNION ALL
SELECT 4 AS order_id, 2 AS product_id, 3 AS quantity
UNION ALL
SELECT 5 AS order_id, 16 AS product_id, 3 AS quantity
UNION ALL
SELECT 5 AS order_id, 5 AS product_id, 1 AS quantity
UNION ALL
SELECT 6 AS order_id, 1 AS product_id, 1 AS quantity
UNION ALL
SELECT 6 AS order_id, 8 AS product_id, 2 AS quantity
UNION ALL
SELECT 7 AS order_id, 4 AS product_id, 2 AS quantity
UNION ALL
SELECT 7 AS order_id, 11 AS product_id, 3 AS quantity
UNION ALL
SELECT 8 AS order_id, 7 AS product_id, 3 AS quantity
UNION ALL
SELECT 8 AS order_id, 14 AS product_id, 1 AS quantity
UNION ALL
SELECT 9 AS order_id, 10 AS product_id, 1 AS quantity
UNION ALL
SELECT 9 AS order_id, 17 AS product_id, 2 AS quantity
UNION ALL
SELECT 10 AS order_id, 13 AS product_id, 2 AS quantity
UNION ALL
SELECT 10 AS order_id, 2 AS product_id, 3 AS quantity
UNION ALL
SELECT 11 AS order_id, 16 AS product_id, 3 AS quantity
UNION ALL
SELECT 11 AS order_id, 5 AS product_id, 1 AS quantity
UNION ALL
SELECT 12 AS order_id, 1 AS product_id, 1 AS quantity
UNION ALL
SELECT 12 AS order_id, 8 AS product_id, 2 AS quantity
UNION ALL
SELECT 13 AS order_id, 4 AS product_id, 2 AS quantity
UNION ALL
SELECT 13 AS order_id, 11 AS product_id, 3 AS quantity
UNION ALL
SELECT 14 AS order_id, 7 AS product_id, 3 AS quantity
UNION ALL
SELECT 14 AS order_id, 14 AS product_id, 1 AS quantity
UNION ALL
SELECT 15 AS order_id, 10 AS product_id, 1 AS quantity
UNION ALL
SELECT 15 AS order_id, 17 AS product_id, 2 AS quantity
UNION ALL
SELECT 16 AS order_id, 13 AS product_id, 2 AS quantity
UNION ALL
SELECT 16 AS order_id, 2 AS product_id, 3 AS quantity
UNION ALL
SELECT 17 AS order_id, 16 AS product_id, 3 AS quantity
UNION ALL
SELECT 17 AS order_id, 5 AS product_id, 1 AS quantity
UNION ALL
SELECT 18 AS order_id, 1 AS product_id, 1 AS quantity
UNION ALL
SELECT 18 AS order_id, 8 AS product_id, 2 AS quantity
UNION ALL
SELECT 19 AS order_id, 4 AS product_id, 2 AS quantity
UNION ALL
SELECT 19 AS order_id, 11 AS product_id, 3 AS quantity
UNION ALL
SELECT 20 AS order_id, 7 AS product_id, 3 AS quantity
UNION ALL
SELECT 20 AS order_id, 14 AS product_id, 1 AS quantity
UNION ALL
SELECT 21 AS order_id, 10 AS product_id, 1 AS quantity
UNION ALL
SELECT 21 AS order_id, 17 AS product_id, 2 AS quantity
UNION ALL
SELECT 22 AS order_id, 13 AS product_id, 2 AS quantity
UNION ALL
SELECT 22 AS order_id, 2 AS product_id, 3 AS quantity
UNION ALL
SELECT 23 AS order_id, 16 AS product_id, 3 AS quantity
UNION ALL
SELECT 23 AS order_id, 5 AS product_id, 1 AS quantity
UNION ALL
SELECT 24 AS order_id, 1 AS product_id, 1 AS quantity
UNION ALL
SELECT 24 AS order_id, 8 AS product_id, 2 AS quantity
UNION ALL
SELECT 25 AS order_id, 4 AS product_id, 2 AS quantity
UNION ALL
SELECT 25 AS order_id, 11 AS product_id, 3 AS quantity
) AS v JOIN products p ON p.product_id=v.product_id;


UPDATE orders o JOIN (SELECT order_id,SUM(line_total) AS amount FROM order_items GROUP BY order_id) x
 ON x.order_id=o.order_id SET o.total_amount=x.amount;
INSERT INTO payments(order_id,method,payment_status,amount,paid_at)
SELECT order_id,'COD',CASE WHEN status='delivered' THEN 'collected' WHEN status='cancelled' THEN 'void' ELSE 'pending' END,
 total_amount,CASE WHEN status='delivered' THEN order_date ELSE NULL END FROM orders;
-- Historic active orders (excluding cancelled) consume stock; items 19 and 20 remain low/out of stock.
UPDATE products p JOIN
 (SELECT oi.product_id,SUM(oi.quantity) AS units FROM order_items oi JOIN orders o ON o.order_id=oi.order_id
  WHERE o.status <> 'cancelled' GROUP BY oi.product_id) x ON x.product_id=p.product_id
SET p.stock_qty=p.stock_qty-x.units;