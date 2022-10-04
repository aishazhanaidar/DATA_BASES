create table customers(
    id int primary key NOT NULL,
    full_name varchar(50) NOT NULL,
    timestamp timestamp NOT NULL ,
    delivery_address text NOT NULL,
    UNIQUE (id)
);

create table orders(
    code int primary key NOT NULL ,
    customer_id int,
    total_sum double precision NOT NULL ,
    is_paid boolean NOT NULL ,
    foreign key  (customer_id) references customers(id),
    UNIQUE (code)
);

create table products(
    id varchar primary key NOT NULL ,
    name varchar NOT NULL ,
    description text ,
    price double precision NOT NULL,
    UNIQUE (id, name)
);

create table order_items(
    order_code int NOT NULL ,
    product_id varchar NOT NULL ,
    quantity int NOT NULL CHECK ( quantity > 0 ) ,
    primary key (order_code, product_id),
    foreign key (order_code) references orders(code),
    foreign key (product_id) references products(id),
    UNIQUE (order_code, product_id)
);
INSERT INTO customers (id, full_name, timestamp, delivery_address)
VALUES (11111, 'Aisha Khan', '2016-06-22 19:10:25-07', 'st. Ualikhanov, 21');

INSERT INTO products (id, name, description, price)
VALUES ('171715', 'doll', '', 855);

INSERT INTO products (id, name, description, price)
VALUES ('171716', 'car toy', '', 680);

INSERT INTO orders (code, customer_id, total_sum, is_paid)
VALUES (1122333, 11111, 15.4555,  true);

INSERT INTO order_items (order_code, product_id, quantity)
VALUES (1122333, '171715', 5);

UPDATE products
SET description = 'color is red'
WHERE name = 'car toy'
RETURNING *;

DELETE FROM products
WHERE id = '171716';


