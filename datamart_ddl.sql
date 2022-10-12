create table if not exists analysis.dm_rfm_segments (
user_id int not null primary key,
recency int not null check(recency >= 1 and recency <= 5),
frequency int not null check(recency >= 1 and recency <= 5),
monetary_value int not null check(recency >= 1 and recency <= 5) 
);
