# Write your MySQL query statement below
with cte as(select e1.employee_id, e1.name, e2.age from Employees as e1
join Employees as e2 on e1.employee_id=e2.reports_to)

select employee_id, name,count(*) as reports_count, round(avg(age)) as average_age 
from cte group by employee_id
order by employee_id
