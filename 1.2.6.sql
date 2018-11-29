SELECT 
	*
FROM
	denver_listings
ORDER BY price DESC
-- Most expensive is 9999 - there are 9 listings at this price. 
-- All of them are full homes except for one which is a private room.


SELECT 
	neighbourhood,
	COUNT(*) as number_of_listings
FROM
	denver_listings
GROUP BY 1
ORDER BY number_of_listings DESC
-- This will show the neighborhood with the highest number of listings. That neighborhood is Five Points.
SELECT 
	neighbourhood,
	SUM(reviews_per_month) as avg_number_of_reviews
FROM
	denver_listings
GROUP BY 1
ORDER BY avg_number_of_reviews DESC
-- This shows that the neighbourhood Five Points also has the highest number of reviews - going hand in hand with the higher number of listings.

--Tried this query but unfortunately the pricing has $ before it and is considered text. I don't know how to edit this. 
SELECT
	calendar_date,
	AVG(price) as avg_price
FROM
	denver_calendar
GROUP BY 1
ORDER BY avg_price DESC;

--When is busiest - grouping by day and then counting how many listings are not available (filled). 
SELECT
	calendar_date,
	COUNT(available) as avg_availability
FROM
	denver_calendar
WHERE
	available LIKE 'f'
GROUP BY 1
ORDER BY avg_availability DESC;
--looks as if it is busiest during october
