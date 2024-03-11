



select id, city_name
from d_cities

create table d_cities(
	id serial primary key,
	city_name varchar(50)
);

insert into d_cities(city_name)
select 'Moscow' as city_name
union all
select 'Saint-Petersburg' as city_name
union all
select 'Luga' as city_name;


create table d_products(
	id serial primary key,
	product_name varchar(100)
);

insert into d_products(product_name)
select 'Snikers' as product_name
union all
select 'Vodka' as product_name
union all
select 'Cookies' as product_name;

select *
from d_products;

create table d_customers(
	id serial primary key,
	customer_name varchar(100),
	account_number varchar(50),
	inn varchar(50),
	city_id int not null
)

insert into d_customers(customer_name, account_number, inn, city_id)
select 'Customer 1' AS customer_name, '12345' as account_number, '0001230003' as inn, 2 as city_id
union all
select 'Rulon Oboev' AS customer_name, '76543' as account_number, '777555777' as inn, 3 as city_id
union all
select 'Aslanbek Aslanbekov' AS customer_name, '555555' as account_number, '0005555000' as inn, 1 as city_id;

select *
from d_customers


create table f_orders(
	id serial primary key,
	buy_time timestamp default now(),
	product_id int not null,
	city_id int not null,
	customer_id int not null,
	value float not null,
	costs float not null
)

insert into f_orders(product_id, city_id, customer_id, value, costs)
select 1 as product_id, 1 as city_id, 1 as customer_id, 200.0 AS value, 2000.0 as costs
union all
select 2 as product_id, 2 as city_id, 2 as customer_id, 50.0 AS value, 10000.0 as costs
union all
select 3 as product_id, 3 as city_id, 3 as customer_id, 1150.0 AS value, 23000.0 as costs
union all
select 1 as product_id, 2 as city_id, 3 as customer_id, 200.0 AS value, 3000.0 as costs
union all
select 2 as product_id, 3 as city_id, 1 as customer_id, 500.0 AS value, 70000.0 as costs
union all
select 3 as product_id, 1 as city_id, 2 as customer_id, 80.0 AS value, 2500.0 as costs
;


update f_orders set buy_time = buy_time - INTERVAL '2 DAY';

select *
from f_orders

--агрегат
select buy_time::date as buy_date, product_id, city_id, customer_id, SUM(value) as total_value, SUM(costs) as total_costs
from f_orders
group by buy_date, product_id, city_id, customer_id;

--витрина
select buy_time::date as buy_date,
P.product_name as product_name,
C.city_name as order_city_name,
CU.customer_name as customer_name,
CU.account_number as account_number,
CC.city_name as customer_city_name,
SUM(value) as total_value,
SUM(costs) as total_costs
from f_orders O
left join d_cities C on
	O.city_id = C.id
left join d_products as P on
	O.product_id = P.id
left join d_customers CU on
	O.customer_id = CU.id
left join d_cities as CC on
	CU.city_id = CC.id
group by buy_date, product_name, order_city_name, customer_name, account_number, customer_city_name;



create table dm_orders(
	buy_date date not NULL,
	product_name varchar(100),
	order_city_name varchar(50),
	customer_name varchar(100),
	account_number varchar(50),
	customer_city_name varchar(50),
	total_value float not null,
	total_costs float not null
)

insert into dm_orders(buy_date, product_name, order_city_name, customer_name, account_number, customer_city_name, total_value, total_costs)
select buy_time::date as buy_date,
P.product_name as product_name,
C.city_name as order_city_name,
CU.customer_name as customer_name,
CU.account_number as account_number,
CC.city_name as customer_city_name,
SUM(value) as total_value,
SUM(costs) as total_costs
from f_orders O
left join d_cities C on
	O.city_id = C.id
left join d_products as P on
	O.product_id = P.id
left join d_customers CU on
	O.customer_id = CU.id
left join d_cities as CC on
	CU.city_id = CC.id
group by buy_date, product_name, order_city_name, customer_name, account_number, customer_city_name;


select *
from dm_orders

grant insert on dm_orders to pandas_user
grant delete on dm_orders to pandas_user

grant select on f_orders to pandas_user;
grant select on d_cities to pandas_user;
grant select on d_products to pandas_user;
grant select on d_customers to pandas_user;


