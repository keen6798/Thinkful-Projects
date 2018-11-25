-- What was the hottest dat in our data set? Where was that?
SELECT 
	zip,
	MAX(maxtemperaturef) as max_temp
From 
	weather
GROUP BY 1;
-- The hottest day was 134 degrees F and was at zip 94063 (Redwood City, CA). 

-- How many trips started at each station?
SELECT
	start_station,
	COUNT(*) as start_trip_count
FROM
	trips
GROUP BY 1;

-- What's the shortest trip that happened?
SELECT
	MIN(duration) as min_duration
From 
	trips;
-- answer is 60 (not sure what the units are.. minutes?)

--What is the average trip duration, by end of station?
SELECT
	end_station,
	AVG(duration) as avg_duration
From 
	trips
GROUP BY 1;
