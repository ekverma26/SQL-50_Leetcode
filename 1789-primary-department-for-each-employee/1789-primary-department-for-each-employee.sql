# Write your MySQL query statement below
with cte as(
    select *, rank() over(partition by employee_id  order by primary_flag) as rank_emp
    from employee
)

select employee_id , department_id from cte 
where rank_emp=1