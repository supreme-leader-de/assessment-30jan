-- write your solution here

select
    (select id from footer_values order by id desc limit 1) as id,
    (select car from footer_values where car is not null order by id desc limit 1) as car,
    (select length from footer_values where length is not null order by id desc limit 1) as length,
    (select width from footer_values where width is not null order by id desc limit 1) as width,
    (select height from footer_values where height is not null order by id desc limit 1) as height;
