-- CREATE DATABASE ecom_management;
-- USE ecom_management;

-- CREATE TABLE categories (
--  category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
--  title VARCHAR(80) NOT NULL UNIQUE,
--  description VARCHAR(255) NULL,
--  CONSTRAINT chk_category_name CHECK (CHAR_LENGTH(TRIM(title)) > 0)
-- ) ENGINE=InnoDB;

-- CREATE TABLE products (
--  product_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
--  category_id INT UNSIGNED NOT NULL,
--  sku VARCHAR(32) NOT NULL UNIQUE,
--  name VARCHAR(120) NOT NULL,
--  description TEXT NULL,
--  price DECIMAL(10,2) NOT NULL,
--  stock_qty INT UNSIGNED NOT NULL DEFAULT 0,
--  image_url VARCHAR(255) NULL,
--  is_active BOOLEAN NOT NULL DEFAULT TRUE,
--  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  CONSTRAINT chk_product_price CHECK(price > 0),
--  CONSTRAINT chk_product_name CHECK(CHAR_LENGTH(TRIM(name)) > 0),
--  CONSTRAINT chk_product_stock CHECK(stock_qty >= 0),
--  CONSTRAINT chk_product_active CHECK(is_active IN (0,1)),
--  CONSTRAINT fk_product_category FOREIGN KEY(category_id) REFERENCES categories(category_id) ON UPDATE RESTRICT ON DELETE RESTRICT
-- ) ENGINE=InnoDB;

-- CREATE TABLE customers (
--  customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
--  full_name VARCHAR(100) NOT NULL,
--  email VARCHAR(160) NOT NULL UNIQUE,
--  phone VARCHAR(20) NOT NULL,
--  shipping_address VARCHAR(255) NOT NULL,
--  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  CONSTRAINT chk_customer_name CHECK(CHAR_LENGTH(TRIM(full_name)) > 0),
--  CONSTRAINT chk_customer_email CHECK(email LIKE '%_@_%._%'),
--  CONSTRAINT chk_customer_phone CHECK(CHAR_LENGTH(TRIM(phone)) > 0),
--  CONSTRAINT chk_customer_address CHECK(CHAR_LENGTH(TRIM(shipping_address)) > 0)
-- ) ENGINE=InnoDB;

-- CREATE TABLE orders (
--  order_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
--  customer_id INT UNSIGNED NOT NULL,
--  order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
--  status ENUM('placed','confirmed','shipped','delivered','cancelled') NOT NULL DEFAULT 'placed',
--  total_amount DECIMAL(10,2) NOT NULL,
--  cancelled_at DATETIME NULL,
--  CONSTRAINT chk_order_total CHECK(total_amount >= 0),
--  CONSTRAINT chk_order_cancelled_at CHECK((status = 'cancelled' AND cancelled_at IS NOT NULL) OR (status <> 'cancelled' AND cancelled_at IS NULL)),
--  CONSTRAINT fk_order_customer FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE RESTRICT ON UPDATE RESTRICT
-- ) ENGINE=InnoDB;

-- CREATE TABLE order_items (
--  order_item_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
--  order_id INT UNSIGNED NOT NULL,
--  product_id INT UNSIGNED NOT NULL,
--  quantity INT UNSIGNED NOT NULL,
--  unit_price DECIMAL(10,2) NOT NULL,
--  line_total DECIMAL(10,2) NOT NULL,
--  CONSTRAINT uq_order_product UNIQUE(order_id,product_id),
--  CONSTRAINT chk_order_item_quantity CHECK(quantity > 0),
--  CONSTRAINT chk_order_item_price CHECK(unit_price > 0),
--  CONSTRAINT chk_order_item_total CHECK(line_total = quantity * unit_price),
--  CONSTRAINT fk_item_order FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
--  CONSTRAINT fk_item_product FOREIGN KEY(product_id) REFERENCES products(product_id) ON DELETE RESTRICT ON UPDATE RESTRICT
-- ) ENGINE=InnoDB;


