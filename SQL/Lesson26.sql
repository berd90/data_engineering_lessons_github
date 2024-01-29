SELECT id, full_name, human_type
FROM public.humans;


select SUM(id) as sid, SUM(human_type) as sht, COUNT(*) as cnt, count(distinct human_type) as cht,
MIN(id) as min_id, MAX(id) as max_id, avg(id)::int as aid
--into my_new_test_table
from public.humans
where human_type = 2
;

select *
from my_new_test_table;

select human_type, count(distinct id) as cnt
from public.humans
where 1=1
group by human_type;


SELECT id, type_name
FROM public.human_types;


select ht.type_name, count(distinct h.id) as cnt
from public.humans h
left join public.human_types ht on
	h.human_type = ht.id
where 1=1
group by ht.type_name;