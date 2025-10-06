# Write your MySQL query statement below
with cte as(
select s1.student_id, s1.student_name, s2.subject_name 
from Students as s1 cross join Subjects as s2 
order by s1.student_id)

select c.student_id, c.student_name, c.subject_name, count(e.subject_name) as attended_exams 
from cte as c left join Examinations as e 
on c.student_id = e.student_id and c.subject_name = e.subject_name
group by c.student_id,c.student_name, c.subject_name
order by c.student_id,c.subject_name