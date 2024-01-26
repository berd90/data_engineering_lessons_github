



select H.full_name, HT.type_name, H.human_type, HT.id
from humans H
inner join human_types HT on
	H.human_type = HT.id


select *
from humans
where
	(id between 1 and 3)
	or (id between 2 and 4)
	and now()::date between '2024-01-01' and '2024-12-31'
;

select *
from humans
where id >= 1 and id <= 3
;

select *
from humans
where id in (1, 2, 4)
;


select *
from human_types;


select H.full_name, HT.type_name, H.human_type, coalesce(HT.id::varchar(50), HT.type_name, 0::varchar(50)) as id
from humans H
LEFT join human_types HT on
	H.human_type = HT.id
;

select H.full_name, HT.type_name, H.human_type, coalesce(HT.id::varchar(50), HT.type_name, 0::varchar(50)) as id
from humans H
FULL join human_types HT on
	H.human_type = HT.id


select *
from humans H
left join (
	select H.full_name, HT.type_name, H.human_type, coalesce(HT.id::varchar(50), HT.type_name, 0::varchar(50)) as id
	from human_types HT
	LEFT join humans H on
		H.human_type = HT.id
	) T on
	H.human_type::varchar(50) = T.id
;
