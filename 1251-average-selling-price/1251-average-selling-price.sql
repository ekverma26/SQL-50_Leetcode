# Write your MySQL query statement below
with cte as
(select p.product_id, p.price*u.units as total,  u.units as units from Prices as p
left join UnitsSold as u on p.product_id=u.product_id 
where u.purchase_date between p.start_date and p.end_date  
)

select product_id, ifnull(round(sum(total)/sum(units), 2),0) as average_price  from cte 
group by product_id