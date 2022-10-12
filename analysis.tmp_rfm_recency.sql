insert into analysis.tmp_rfm_recency 
with u as (
select user_id,
       max(orders.order_ts) as last_order_ts                  
from production.orders
where order_ts > '2022-01-01' and status = 4
group by user_id)
select u.user_id,
       ntile(5) over (order by (select max(orders.order_ts) from production.orders) - u.last_order_ts desc) recency
from u;     
 