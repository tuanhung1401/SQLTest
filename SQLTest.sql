CREATE DATABASE sql_test;


-- ==============================================================
-- Ex1--

CREATE TABLE categories (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	category_code VARCHAR(50) NOT NULL,
	category_name VARCHAR(50) NOT NULL,
	created_date DATE NOT NULL,
	updated_date DATE NOT NULL
	);

CREATE TABLE products (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	product_code VARCHAR(50) NOT NULL, 
	product_name VARCHAR(50) NOT NULL, 
	image VARCHAR(50),
	DESCRIPTION VARCHAR(200),
	price DOUBLE,
	quantity INT, 
	country VARCHAR(50),
	is_new ENUM ('NEW', 'NOT_NEW'),
	created_date DATE NOT NULL,
	updated_date DATE NOT NULL
	);

CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
	quantity INT NOT NULL, 
	price DOUBLE NOT NULL, 
	paid_date DATE NOT NULL, 
	created_date DATE,
	updated_date DATE
	);

CREATE TABLE order_products (
	order_id INT,
	product_id BIGINT,
	FOREIGN KEY (order_id) REFERENCES ORDERS(id),
	FOREIGN KEY (product_id) REFERENCES products(id),
	PRIMARY KEY (order_id, product_id)
	); 
	 
INSERT INTO categories (id, category_code, category_name, created_date, updated_date)
VALUES
(1, 'LAP', 'Laptop', '2022-12-6', '2022-12-6'),
(2, 'PC', 'Personal Computer', '2022-12-6', '2022-12-6'),
(3, 'KB', 'Keyboard', '2022-12-6', '2022-12-6'),
(4, 'HP', 'Headphone', '2022-12-6', '2022-12-6'),
(5, 'CM', 'Mouse', '2022-12-6', '2022-12-6'),
(6, 'MT', 'Monitor', '2022-12-6', '2022-12-6'),
(7, 'SK', 'Speaker', '2022-12-6', '2022-12-6'),
(8, 'PH', 'Phone', '2022-12-6', '2022-12-6'),
(9, 'MP', 'Mouse Pad', '2022-12-6', '2022-12-6'),
(10, 'USB', 'Usb', '2022-12-6', '2022-12-6');

ALTER TABLE products
ADD COLUMN category_id BIGINT NOT NULL, 
ADD CONSTRAINT FK_category FOREIGN KEY (category_id) 
REFERENCES categories (id);

INSERT INTO products (id, category_id, product_code, product_name, image, DESCRIPTION, price, quantity, country, is_new, created_date, updated_date)
VALUES
(1,1, 'DEL_101', 'Dell Vostro 5410', 'https:abc.jpeg', 'Dell Vostro 5410', 25000000, 22, 'TRUNG_QUOC', 'New', '2022-12-6', '2022-12-6'),
(2,1, 'DEL_102', 'Dell Gaming 4290', 'https:def.jpeg', 'Dell Gaming 4290', 32000000, 4, 'SINGAPORE', 'Not_New', '2022-12-6', '2022-12-6'),
(3,7, 'LEN_101', 'Lenovo Precision 2711', 'https:ghi.jpeg', 'Lenovo Precing 2711', 14000000, 7, 'TRUNG_QUOC', 'New', '2022-12-6', '2022-12-6'),
(4,5, 'LEN_102', 'Lenovo Gaming 0301', 'https:klm.jpeg', 'Lenovo Gaming 0301', 29000000, 43, 'TAY_BAN_NHA', null, '2022-12-6', '2022-12-6'),
(5,4, 'GAR_101', 'Garena 101', 'https:nop.jpeg', 'Garena 101', 50000000, 2, 'PHAP', null, '2022-12-6', '2022-12-6'),
(6,2, 'GAR_102', 'Garena 102', 'https:qrs.jpeg', 'Garena 102', 9000000, 2, 'DUC', 'New', '2022-12-6', '2022-12-6'),
(7,3, 'ACE_101', 'Acer Notebook T301', 'https:dop.jpeg', 'Acer Notebook T301', 12000000, 17, 'ANH', 'Not_New', '2022-12-6', '2022-12-6'),
(8,10, 'ACE_102', 'Acer Notebook G302', 'https:way.jpeg', 'Acer Notebook G302', 46000000, 52, 'HOA_KY', 'New', '2022-12-6', '2022-12-6'),
(9,9, 'ASU_101', 'Asus Zenbook G571', 'https:zyl.jpeg', 'Asus Zenbook G571', 34000000, 12, 'SINGAPORE', 'Not_New', '2022-12-6', '2022-12-6'),
(10,6, 'ASU_102', 'Asus Zenbook U401', 'https:zpx.jpeg', 'Asus Zenbook U401', 19000000, 31, 'MALAYSIA', null, '2022-12-6', '2022-12-6');

INSERT INTO orders (id, quantity, price, paid_date, created_date, updated_date)
VALUES 
(1, 1, 25000000, '2022-11-25', '2022-12-6', '2022-12-6'),
(2, 1, 14000000, '2022-11-25', '2022-12-6', '2022-12-6'),
(3, 1, 46000000, '2022-11-26', '2022-12-6', '2022-12-6'),
(4, 1, 19000000, '2022-11-26', '2022-12-6', '2022-12-6'),
(5, 1, 34000000, '2022-11-27', '2022-12-6', '2022-12-6'),
(6, 1, 9000000, '2022-11-27', '2022-12-6', '2022-12-6'),
(7, 1, 56000000, '2022-11-27', '2022-12-6', '2022-12-6'),
(8, 1, 42000000, '2022-11-28', '2022-12-6', '2022-12-6'),
(9, 1, 18000000, '2022-11-28', '2022-12-6', '2022-12-6'),
(10, 1, 22000000, '2022-11-28', '2022-12-6', '2022-12-6');

INSERT INTO order_products (order_id, product_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

SELECT product_code, product_name, country, category_name 
FROM products JOIN categories
ON (products.category_id = categories.id);

SELECT *
FROM products 
WHERE product_name LIKE '%g%';

SELECT *
FROM products
WHERE product_name LIKE '%g%' AND quantity >20;

SELECT paid_date,COUNT(*) AS 'Number of Orders'
FROM orders
GROUP BY paid_date

-- ==============================================================




-- Ex2--

CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50),
	salary DOUBLE,
	managerId INT
	);

INSERT INTO employees (id, NAME, salary, managerId)
VALUES 
(1,'Joe', 70000, 3),
(2,'Henry', 80000, 4),
(3,'Sam', 60000, null),
(4,'Max', 90000, NULL);
	
SELECT a.name
FROM employees a JOIN employees b
ON (a.managerId = b.Id)
WHERE a.salary > b.salary;

-- ==============================================================




-- Ex3--

CREATE TABLE person (
	id INT PRIMARY key AUTO_INCREMENT,
	email VARCHAR(50)
	);

INSERT INTO person (id, email)
VALUES 
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

SELECT email
FROM person
GROUP BY email
HAVING COUNT(*) > 1
-- ==============================================================




-- Ex4--
CREATE TABLE customers (
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50));

INSERT INTO customers (id, NAME)
VALUES 
(1,'Joe'),
(2,'Henry'),
(3,'Sam'),
(4,'Max');

CREATE TABLE orders_2 (
	id INT PRIMARY KEY AUTO_INCREMENT,
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(id)
	);

INSERT INTO orders_2 (id,customer_id)
VALUES
(1,3),
(2,1);

SELECT name
FROM customers left JOIN orders_2
ON (orders_2.customer_id = customers.Id)
WHERE orders_2.id IS null;
