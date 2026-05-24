CREATE DATABASE salesDB;
CREATE SCHEMA sales;

CREATE TABLE sales.customers (
    customer_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL ,
    last_name VARCHAR(50) NOT NULL ,
    email VARCHAR(100) NOT NULL UNIQUE ,
    phone VARCHAR(10)
);

CREATE TABLE sales.products (
    product_id SERIAL PRIMARY KEY ,
    product_name VARCHAR(100) NOT NULL ,
    price NUMERIC(10, 2) NOT NULL ,
    stock_quantity INT NOT NULL
);

CREATE TABLE sales.orders (
    order_id SERIAL PRIMARY KEY ,
    order_date DATE NOT NULL ,
    customer_id INT ,
    FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id)
);

CREATE TABLE sales.orderitems (
    order_item_id SERIAL PRIMARY KEY ,
    quantity INT CHECK ( quantity > 1 ),
    order_id INT,
    product_id INT,
    FOREIGN KEY (order_id) REFERENCES sales.orders(order_id),
    FOREIGN KEY (product_id) REFERENCES sales.products(product_id)
);
