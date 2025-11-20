# Write your MySQL query statement below
with cte as(select p.product_id, p.product_name, sum(o.unit) as unit 
from Products as p inner join Orders as o
on p.product_id=o.product_id
where month(order_date)=2 and year(order_date)=2020
group by p.product_id) 

select product_name, unit from cte 
where unit>=100