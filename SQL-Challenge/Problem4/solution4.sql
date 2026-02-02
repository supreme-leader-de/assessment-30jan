-- write your solution here

select *
from day_indicator
where substring(day_indicator, weekday(dates), 1) = weekday(dates);
