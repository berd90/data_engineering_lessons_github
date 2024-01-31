
----------------- 1-1
select b.starttime
FROM cd.members m
JOIN cd.bookings b ON
	m.memid = b.memid
WHERE
	m.firstname = 'David'
	AND m.surname = 'Farrell'


----------------- 1-2
SELECT B.starttime AS start, F.name AS name
FROM cd.bookings B
JOIN cd.facilities F ON
	B.facid = F.facid
WHERE
	B.starttime BETWEEN '2012-09-21 00:00:00'::timestamp AND '2012-09-21 23:59:59.999'::timestamp
	AND F.name like 'Tennis Court%'
ORDER BY B.starttime

----------------- 1-3
SELECT DISTINCT T2.firstname, T2.surname
FROM cd.members T1
JOIN cd.members T2 ON
	T1.recommendedby = T2.memid
ORDER BY T2.surname, T2.firstname


----------------- 1-4
SELECT T1.firstname AS memfname, T1.surname AS memsname, T2.firstname AS recfname, T2.surname AS recsname
FROM cd.members T1
LEFT JOIN cd.members T2 ON
	T1.recommendedby = T2.memid
ORDER BY T1.surname, T1.firstname


------------------------------------------------------------
----------------- 2-1
SELECT COUNT(*) AS count
FROM cd.facilities

----------------- 2-2
SELECT COUNT(*) AS count
FROM cd.facilities
WHERE guestcost >= 10

----------------- 2-3
SELECT recommendedby, COUNT(DISTINCT memid) AS count
FROM cd.members
WHERE NOT recommendedby IS NULL
GROUP BY recommendedby
ORDER BY recommendedby

----------------- 2-4
SELECT facid, SUM(slots) AS Total_Slots
FROM cd.bookings
GROUP BY facid
ORDER BY facid

----------------- 2-5
SELECT facid, SUM(slots) AS Total_Slots
FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01'::date::timestamp AND '2012-09-30 23:59:59.999'::timestamp
GROUP BY facid
ORDER BY Total_Slots

----------------- 2-6
SELECT facid, date_part('month', starttime) AS m, SUM(slots) AS Total_Slots
FROM cd.bookings
WHERE starttime BETWEEN '2012-01-01'::date::timestamp AND '2012-12-31 23:59:59.999'::timestamp
GROUP BY facid, m
ORDER BY facid, m



