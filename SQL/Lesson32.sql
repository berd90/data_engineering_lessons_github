
create table input_table_with_data(
	country_name varchar(100),
	country_code varchar(100),
	series_name varchar(1000),
	series_code varchar(100),
	year1990 varchar(100),
	year2000 varchar(100),
	year2013 varchar(100),
	year2014 varchar(100),
	year2015 varchar(100),
	year2016 varchar(100),
	year2017 varchar(100),
	year2018 varchar(100),
	year2019 varchar(100),
	year2020 varchar(100),
	year2021 varchar(100),
	year2022 varchar(100)
)

create table main_data_table(
	id serial,
	country_name varchar(100),
	country_code varchar(100),
	series_name varchar(1000),
	series_code varchar(100),
	year1990 float ,
	year2000 float ,
	year2013 float ,
	year2014 float ,
	year2015 float ,
	year2016 float ,
	year2017 float ,
	year2018 float ,
	year2019 float ,
	year2020 float ,
	year2021 float ,
	year2022 float
)

ALTER ROLE test_user2 WITH SUPERUSER;


COPY input_table_with_data
FROM '/tmp/data.csv'
DELIMITER ','
CSV HEADER;


insert into main_data_table(country_name, country_code, series_name, series_code, year1990, year2000)
SELECT country_name, country_code, series_name, series_code,
case
	when year1990 = '' then null
	when year1990 = '100' then 100
	else year1990::float
end as year1990,
case
	when year2000 = '' then null
	when year2000 = '100' then 150
	else year2000::float
end as year2000
FROM public.input_table_with_data;


select *
from main_data_table;


select country_name, series_name,
SUM(case
		when year1990 < 90.0 then 0
		else year1990
end
) as year1990_filtered,
SUM(year1990) as year1990
from main_data_table
group by country_name, series_name