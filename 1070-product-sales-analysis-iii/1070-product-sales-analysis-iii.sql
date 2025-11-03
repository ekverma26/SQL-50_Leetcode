# Write your MySQL query statement below
with cte as 
(select product_id, min(year) as first_year from Sales
group by product_id)

select c.product_id, c.first_year, s.quantity , s.price from Sales
as s inner join cte as c on s.product_id = c.product_id and s.year = c.first_year
