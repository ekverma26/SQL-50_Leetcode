# Write your MySQL query statement below
with cte as(
select *,dense_rank() over(order by salary desc) as rn 
from Employee)

select max(case when rn=2 then salary else null end) as SecondHighestSalary from cte
where rn=2