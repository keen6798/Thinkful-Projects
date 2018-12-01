-- What are the three longest trips on rainy days?
WITH rainy as (
	SELECT 
		DATE(date) rain_date
	FROM
		weather
	WHERE
		events LIKE 'Rain'
	GROUP BY 1
)

SELECT 
	trip_id,
	duration,
	DATE(start_date)
FROM 
	trips
JOIN
	rainy
ON DATE(start_date) = rain_date
ORDER BY duration DESC
LIMIT 3

-- Which station is full most often?
SELECT
	status.station_id,
	stations.name,
	COUNT(CASE WHEN docks_available=0 then 1 END) full_count
FROM 
	status
JOIN 
	stations
ON stations.station_id = status.station_id
GROUP BY 1,2
ORDER BY empty_count DESC

-- Return a list of stations with a count of number of trips starting at that station but ordered by dock count.
SELECT
	start_station,
	dockcount,
	COUNT(*)
FROM 
	trips
JOIN 
	stations
ON stations.name = trips.start_station
GROUP BY 1, 2
ORDER BY 2 DESC
