SELECT id, full_name, human_type
FROM public.humans;


select *
from public.human_types;


--Подзапрос джоиним с таблицей
select HT.type_name, T.cnt
from
	(select human_type, COUNT(*) as cnt
	from public.humans
	group by human_type) T
join public.human_types HT on
	T.human_type = HT.id;

--Подзапрос внутри WITH джоиним с обычной таблицей
with human_counts as (
	select human_type, COUNT(*) as cnt
	from public.humans
	group by human_type
)
select HT.type_name, HC.cnt
from human_counts HC
join public.human_types HT on
	HC.human_type = HT.id;


--Поздапрос внутри WITH, джоиним сам на себя
with human_counts as (
	select human_type, COUNT(*) as cnt
	from public.humans
	group by human_type
)
select *
from human_counts T1
join human_counts T2 on
	T1.human_type = T2.human_type;


--2 вложенных запроса
select *
from (select human_type, COUNT(*) as cnt
	from public.humans
	group by human_type) T1
join (select human_type, COUNT(*) as cnt
	from public.humans
	group by human_type) T2 on
	T1.human_type = T2.human_type;



--2 подзапроса внутри WITH
with human_counts as (
	select human_type, COUNT(*) as cnt
	from public.humans
	group by human_type
),
human_counts_agg as(
	select SUM(cnt) as ctn
	from human_counts
)
select *
from human_counts T1
join human_counts T2 on
	T1.human_type = T2.human_type;



--WITH
-------------------------------------------------------------------------------------------------------------------------------
--ROW_NUMBER()


create table d_users(
	id int not null,
	created date not null default now(),
	full_name varchar(255) not null default '',
	primary key(id, created)
);


insert into d_users(id, created, full_name)
select 1 as id, '2020-01-01'::date as created, 'Ваня Иванов' as full_name
union all
select 1 as id, '2021-01-01'::date as created, 'Ваня Петров' as full_name
union all
select 1 as id, '2022-01-01'::date as created, 'Ваня Сидоров' as full_name
union all
select 1 as id, '2023-01-01'::date as created, 'Жанна Сидорова' as full_name
;

insert into d_users(id, created, full_name)
select 2 as id, '2020-01-01'::date as created, 'Петя Иванов' as full_name
union all
select 2 as id, '2021-01-01'::date as created, 'Петя Петров' as full_name
union all
select 2 as id, '2022-01-01'::date as created, 'Петя Сидоров' as full_name
union all
select 2 as id, '2023-01-01'::date as created, 'Педя Сидорова' as full_name


--Первый работающий запрос
with max_dates AS(
	select id, MAX(created) as max_created
	from d_users
	where created <= '2022-02-24'
	group by id
	)
select U.*
from max_dates MD
join d_users U on
	MD.id = U.id
	and U.created = MD.max_created
;

select id, created, full_name, row_number() OVER(partition by id order by created desc) as n
from d_users
where created <= '2022-02-24';

select id, created, full_name, row_number() over () as n
from d_users
where created <= '2022-02-24';


--Самый правильный вариант - работает как минимум втрое быстрее
select *
from (
	select id, created, full_name, row_number() OVER(partition by id order by created desc) as N
	from d_users
	where created <= '2022-02-24') T
where T.N = 1
;