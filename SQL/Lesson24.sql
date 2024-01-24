CREATE TABLE public.d_specialisation (
	id serial4 NOT NULL,
	specialisation varchar(100) NULL,
	CONSTRAINT d_specialisation_pkey PRIMARY KEY (id)
);

create table humans(
	id serial,
	full_name varchar(100),
	human_type int default 0,
	primary key(id)
)


create table human_types(
	id int,
	type_name varchar(50),
	primary key (id)
)


insert into humans(full_name, human_type)
select 'Axmed' as full_name, 4 as human_type

select 1 as id, 'Vasya' as full_name, 1 as human_type
union all
select 2 as id, 'Petya' as full_name, 2 as human_type
union all
select 3 as id, 'Ivan' as full_name, 2 as human_type

select *
from humans;

insert into human_types(id, type_name)
select 1 as id, 'Визажист' as type_name
union all
select 2 as id, 'Программист' as type_name
union all
select 3 as id, 'Дизайнер' as type_name
;


select *
from d_specialisation ds

insert into d_specialisation (id, specialisation)
select 1 as id, 'причёски' as specialisation
union all
select 2 as id, 'фронтендер' as specialisation
union all
select 3 as id, 'бекендер' as specialisation


select *
from humans;

select *
from human_types
;



select H.full_name, HT.type_name, H.human_type, HT.id
from humans H
inner join human_types HT on
	H.human_type = HT.id
;
	--1 = 1

--Очень старый синтаксис
select H.full_name, HT.type_name, H.human_type, HT.id
from humans H, human_types HT
where h.human_type = HT.id
;


select H.full_name, HT.type_name, S.specialisation,  H.human_type, HT.id
from humans H
inner join human_types HT on
	H.human_type = HT.id
join d_specialisation S on
	H.id = S.id
;
