insert into analysis.tmp_rfm_monetary_value  
with u as (
select orders.user_id,
       count(*) as order_count                  
from production.orders
where orders.order_ts > '2022-01-01' and orders.status = 4
group by orders.user_id)
select u.user_id,
       ntile(5) over (order by u.order_count) monetary_value
from u;           
 