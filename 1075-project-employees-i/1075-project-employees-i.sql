# Write your MySQL query statement below
with cte as 
(select p.project_id, p.employee_id, e.name, e.experience_years 
from Project as p inner join Employee as e
on p.employee_id = e.employee_id)

select project_id, round(avg(experience_years),2) as average_years 
from cte group by project_id