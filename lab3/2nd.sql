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
