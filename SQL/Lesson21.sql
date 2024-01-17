create table d_specialisation(
	id serial,
	specialisation varchar(100),
	UNIQUE (specialisation),
	primary key(id)
)

create table d_doctors(
	id int,
	name varchar(50),
	family_name varchar(50),
	id_specialisation int,
	begin_date timestamp not null default now(),
	end_date timestamp default '2050-01-01'::date::timestamp,
	sex bool,
	work_begin_date date,
	primary key(id, begin_date)
)

create table d_patient(
	id int,
	name varchar(50),
	family_name varchar(50),
	passport_number varchar(50),
	sex bool not null,
	birth_date date,
	SNILS varchar(50),
	begin_date timestamp default now(),
	end_date timestamp default '2050-01-01'::date::timestamp,
	primary key(id, begin_date)
)

create table f_appointment(
	id serial,
	create_date timestamp,
	id_doctor int not null REFERENCES d_doctors (Id),
	id_patient int not null REFERENCES d_patient (Id),
	diagnoz varchar(4000),
	naznachenie varchar(4000),
	cabinet_number varchar(10),
	priem_time_minutes int default 15,
	primary key(id)
)
