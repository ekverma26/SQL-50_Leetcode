# Write your MySQL query statement below
with cte as(select *,row_number() over(order by salary desc) as rn 
from Employee)

select if(max(rn)<2,null, salary) as SecondHighestSalary from cte
where rn=2