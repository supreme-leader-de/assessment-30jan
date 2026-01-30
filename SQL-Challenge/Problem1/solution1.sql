-- write your solution here

select (select CAR from footer_values where CAR is not null order by id desc limit 1) as CAR,
(select LENGTH from footer_values where LENGTH is not null order by id desc limit 1)as LENGTH,
(select WIDTH from footer_values where WIDTH is not null order by id desc limit 1)as WIDTH,
(select HEIGHT from footer_values where HEIGHT is not null order by id desc limit 1)as HEIGHT