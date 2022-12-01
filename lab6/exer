--a
select * from dealer
full outer join client c on dealer.id = c.dealer_id;

--b
select d.name, c.name, c.city, c.priority, s.date, s.amount from dealer d
left join client c on d.id = c.dealer_id
left join sell s on c.id = s.client_id;

--c
select *
from dealer d
inner join client c
on c.city = d.location;

--d
select s.id, s.amount, c.name as client_name, c.city
from sell s
inner join client c
on c.id = s.client_id
where s.amount between 100 and 500;

--e find dealers who works either for one or more client or not yet join under any of the clients
select * from dealer d
full outer join client c on d.id = c.dealer_id;

--f
select c.name, c.city, d.name, d.charge
from dealer d
inner join client c on d.id = c.dealer_id;

--g
select c.name, c.city, d.name, d.charge
from client c
inner join dealer d on d.id = c.dealer_id
where d.charge > 0.12;

--h
select c.name,c.city, s.id as sale_id,s.date,s.amount, d.name as dealer_name, d.charge
from client c
left outer join sell s on c.id=s.client_id
left outer join dealer d on d.id=s.dealer_id;

--i
select c.name as client_name, c.priority as client_grade, d.name as dealer_name, o.id as sale_id, o.amount
from client c
right join dealer d on c.dealer_id = d.id
left join sell o on c.id = o.client_id
and c.dealer_id = o.dealer_id
where o.amount >= 2000;

------------

--a
create view first
as select date, count(distinct client_id),
avg(amount), sum(amount)
from sell
group by date;

--b find top 5 dates with the greatest total sell amount
create view second
as select date
from sell
order by amount desc
limit 5;

--c count the number of sales, compute average and total amount of all sales of each dealer
create view third
as select dealer_id, count(distinct id), avg(id), sum(id)
from sell
group by dealer_id;

--d
create view fourth
as select location, sum(dealer.charge*sell.amount)
from dealer
join sell on dealer.id = sell.dealer_id
group by location;

--e compute number of sales, average and total amount of all sales dealers made in each location
create view fifth
as select location, count(sell.dealer_id), sum(amount), avg(amount)
from dealer
join sell on dealer.id = sell.dealer_id
group by location;

--f compute number of sales, average and total amount of expenses in each city clients made
create  or replace view sixth as
select c.city, count(s.client_id), avg(s.amount), sum(s.amount) from sell s
join client c on s.client_id = c.id
group by c.city;

--g find cities where total expenses more than total amount of sales in locations
create view g as
select c.city, sum(amount * (d.charge + 1)) as cities, sum(amount) as locations
from client c
join sell s on c.id = s.client_id
join dealer d on s.dealer_id = d.id and c.city = d.location
group by city;


