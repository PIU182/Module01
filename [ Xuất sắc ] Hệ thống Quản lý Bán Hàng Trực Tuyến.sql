CREATE SCHEMA shop;

CREATE TABLE shop.users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('Customer','Admin'))
);

CREATE TABLE shop.categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE shop.products (
   product_id SERIAL PRIMARY KEY,
   product_name VARCHAR(100) NOT NULL,
   price NUMERIC(10,2) CHECK (price > 0),
   stock INT CHECK (stock >= 0),
   category_id INT,
   FOREIGN KEY (category_id) REFERENCES shop.categories(category_id)
);

CREATE TABLE shop.orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES shop.users(user_id)
);

CREATE TABLE shop.orderdetails (
    order_detail_id SERIAL PRIMARY KEY,
    quantity INT CHECK (quantity > 0),
    price_each NUMERIC(10,2) CHECK (price_each > 0),
    order_id INT,
    product_id INT,
    FOREIGN KEY (order_id) REFERENCES shop.orders(order_id),
    FOREIGN KEY (product_id) REFERENCES shop.products(product_id)
);

CREATE TABLE shop.payments (
    payment_id SERIAL PRIMARY KEY,
    amount NUMERIC(10,2) CHECK (amount >= 0),
    payment_date DATE NOT NULL,
    method VARCHAR(30) CHECK (method IN ('Credit Card','Momo','Bank Transfer','Cash')),
    order_id INT UNIQUE ,
    FOREIGN KEY (order_id) REFERENCES shop.orders(order_id)
);