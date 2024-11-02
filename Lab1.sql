1. 
SELECT *
FROM cities
ORDER BY population desc
LIMIT 10 OFFSET 10;
2.
select *
from cities
order by name desc
limit 30;
3.
SELECT *
FROM cities
order by region, population desc;;
4.
SELECT distinct region
FROM cities;
5.
select *
from cities
order by region desc, name desc;