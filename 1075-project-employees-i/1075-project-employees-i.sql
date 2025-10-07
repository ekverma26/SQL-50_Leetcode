# Write your MySQL query statement below
select p.project_id, round(avg(e.experience_years),2) as average_years  
from Project as p inner join Employee as eon p.employee_id = e.employee_id group by project_id

