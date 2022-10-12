insert into analysis.dm_rfm_segments
select u.id,
       coalesce(recency, 1),
       coalesce(frequency, 1),
       coalesce(monetary_value, 1)
from analysis.users u
full join analysis.tmp_rfm_recency trr
on u.id = trr.user_id
full join analysis.tmp_rfm_frequency trf
on u.id = trf.user_id
full join analysis.tmp_rfm_monetary_value trmv
on u.id = trmv.user_id;

|id|coalesce|coalesce|coalesce|
|--|--------|--------|--------|
|0|1|3|3|
|1|4|3|3|
|2|2|3|3|
|3|2|3|3|
|4|4|3|3|
|5|5|5|5|
|6|1|3|3|
|7|4|3|3|
|8|1|1|1|
|9|1|2|2|
