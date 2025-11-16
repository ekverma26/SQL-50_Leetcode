# Write your MySQL query statement below
with cte as((select requester_id as id, count(*) as total from RequestAccepted 
group by requester_id)
union all
(select accepter_id as id, count(*) as total from RequestAccepted 
group by accepter_id ))

select id, sum(total) as num from cte group by id
order by num desc limit 1 