create table customer(
    id integer,
    full_name varchar(50),
    timestamp timestamp,
    delivery_address text,
    primary key (id)
);

drop table orders;

create table orders(
    code integer,
    costomer_id integer,
    total_sum double precision,
    is_paid boolean,
    primary key (code),
    foreign key (costomer_id) references customer (id)
)

create table products(
    id integer,
    name varchar,
    discriotion text,
    price double precision,
    primary key (id)
);


create table order_items(
    order_code integer,
    product_id integer,
    quantity integer,
    foreign key (order_code) references orders(code),
    foreign key (product_id) references products(id)
)
