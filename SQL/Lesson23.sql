
create table f_log(
	id serial,
	log_text varchar(200))


select distinct id, log_text
from f_log;


select *
from f_log;

insert into f_log(log_text)
values ('some text');

insert into f_log(log_text)
select 'test test' as log_text;

insert into f_log(log_text)
select log_text
from f_log
where log_text  like 'test%';




select 'some text v2' as log_text
union all
select 'some text v3' as log_text
union all
select 'some text v2' as log_text
union all
select log_text
from f_log
order by log_text
;

drop table mobilized;

create table mobilized (
	id serial,
	full_name varchar(50),
	is_alive boolean not null default true,
	primary key(id)
)

create table gruz200 (
	id int not null,
	full_name varchar(50),
	primary key(id)
)


insert into mobilized (full_name)
select 'Ivan Ivanov' as full_name
union all
select 'Petr Petrov' as full_name
;

select *
from mobilized;

select *
from gruz200;


--Транзакция начинается
BEGIN TRANSACTION;

update mobilized
set is_alive = false, full_name = 'Maxim'
where id = 1;

insert into gruz200 (id, full_name)
select id, full_name
from mobilized
where is_alive = false;

delete from mobilized where is_alive = false;

COMMIT TRANSACTION;
--транзакция заканчивается
