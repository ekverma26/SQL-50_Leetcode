# Write your MySQL query statement below
with cte as (select query_name, rating/position as division, rating  from Queries)

select query_name, round(avg(division), 2) as quality,
round(sum(case when rating<3 then 1 else 0 end)*100 / count(*),2) as poor_query_percentage
from cte group by query_name