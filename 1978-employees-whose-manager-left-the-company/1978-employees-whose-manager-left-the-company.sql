# Write your MySQL query statement below
with cte as(
    select e.employee_id as e_id, e.salary as salary, 
    e.manager_id as m_id1,
    m.employee_id as m_id2
    from Employees as e 
    left join Employees as m
    on e.manager_id = m.employee_id
)

select e_id as employee_id 
from cte where salary <=30000 and m_id1 is not null and m_id2 is null 
order by e_id
