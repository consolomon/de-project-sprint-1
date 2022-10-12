create materialized view analysis.users as
select *
from production.users u;

create materialized view analysis.orders as
select * from
production.orders o;

create materialized view analysis.orderitems as
select * from
production.orderitems oi;

create materialized view analysis.orderstatuses as
select * from
production.orderstatuses os;

create materialized view analysis.orderstatuslog as
select * from
production.orderstatuslog osl;

create materialized view analysis.products as
select * from
production.products p;