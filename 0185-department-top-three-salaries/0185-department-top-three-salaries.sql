# Write your MySQL query statement below
with cte as
(select e.name as Employee, 
departmentId,d.name as Department, 
salary,
dense_rank() over(partition by d.name order by salary desc) as r
from Employee as e 
inner join Department as d on e.departmentId = d.id)

select Department, Employee , salary from cte 
where r<=3
