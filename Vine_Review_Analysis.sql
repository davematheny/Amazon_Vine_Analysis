--Deliverable 2
--1
drop table total_votes 
--3342
select *
into total_votes 
from vine_table
where total_votes >= '20'

--2
--1685
drop table total_votes2
select *
into total_votes2 
from total_votes
--where cast(helpful_votes as decimal)/total_votes >= .5
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5

--3
--0 Paid
drop table total_votes3
select *
into total_votes3
from total_votes2
where vine = 'Y'

--4 unpaid
--1685
drop table total_votes4
select *
into total_votes4
from total_votes2
where vine = 'N'

--5
--Determine the total number of reviews(assuming we start from original table vine_table)
--145431
select count(*)
from vine_table

--the number of 5-star reviews
--80677
select count(*)
from vine_table
where star_rating = 5

--the percentage of 5-star reviews for the two types of review (paid vs unpaid)
--Paid will be 0 because total_votes3 is empty

--Unpaid 
--631 out of 1685
--0.3744807121661721
select sum(CAST(case when star_rating = 5 then 1 else 0 end as float)) / count(*)
from total_votes4