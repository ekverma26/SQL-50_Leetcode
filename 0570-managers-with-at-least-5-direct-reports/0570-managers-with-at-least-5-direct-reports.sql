# Write your MySQL query statement below
with cte as
(select e2.managerId, e1.name  from Employee as e1
join Employee as e2 on e1.id = e2.managerId )

select name from (select name, count(managerId) as reportee from cte 
group by managerId) as cte2
where reportee>=5


