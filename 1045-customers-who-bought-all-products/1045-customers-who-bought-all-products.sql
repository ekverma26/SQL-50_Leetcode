# Write your MySQL query statement below

with total_products as(
    select count(*) as total_product from Product
),
products_per_customer as(
    select customer_id, count(distinct(product_key)) as products_bought 
    from Customer group by customer_id
)

select customer_id from products_per_customer, total_products
where products_bought=total_product;
