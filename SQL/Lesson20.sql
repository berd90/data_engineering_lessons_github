create table meat(
	id serial,
	hands_count smallint not null default 2,
	meat_name char(50),
	meat_family_name varchar(4000),
	create_time timestamp default now(),
	modify_time timestamp default now(),
	birth_date date,
	primary key (id)
);


select *
from meat;

insert into meat(meat_name, meat_family_name, birth_date)
values('Ivan', 'Ivanov', '2020-01-01');

SELECT NOW()::DATE::VARCHAR(7);