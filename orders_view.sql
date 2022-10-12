drop materialized view analysis.orders;

create materialized view analysis.orders as
with st as (
select osl.order_id,
       max(osl.dttm) as last_dttm,
       status_id
from production.orderstatuslog osl
group by osl.order_id, osl.status_id)
select o.order_id,
       o.order_ts,
       o.user_id,
       o."cost",
       st.status_id as status
from
production.orders o
join st
on st.order_id = o.order_id and 
   st.last_dttm = o.order_ts;