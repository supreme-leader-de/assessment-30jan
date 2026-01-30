-- write your solution here

SELECT product_id, day_indicator, dates
FROM day_indicator
WHERE SUBSTRING(day_indicator, WEEKDAY(dates) + 1, 1) = '1';
