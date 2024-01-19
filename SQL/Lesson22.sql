select *
FROM public.meat
where
	id <= 3
	or create_time >= now();

select *
FROM public.meat
where
	meat_name = 'Ivan'
;

select REPLACE(meat_family_name, ' ', '') as bez_probelov
FROM public.meat
where
	meat_family_name like '%ov'
;