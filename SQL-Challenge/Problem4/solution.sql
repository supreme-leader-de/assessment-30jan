SELECT product_id, day_indicator, dates
FROM day_indicator
WHERE SUBSTRING(day_indicator, DAYOFWEEK(dates), 1) = '1';