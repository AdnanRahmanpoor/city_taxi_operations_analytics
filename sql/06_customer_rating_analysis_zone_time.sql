-- Analyze customer satisfaction patterns by location and time
SELECT 
	z.zone_type,
	CASE
		WHEN CAST(strftime('%H', r.pickup_datetime) AS INTEGER) BETWEEN 6 AND 11 THEN 'Morning'
		WHEN CAST(strftime('%H', r.pickup_datetime) AS INTEGER) BETWEEN 12 AND 17 THEN 'Afternoon'
		WHEN CAST(strftime('%H', r.pickup_datetime) AS INTEGER) BETWEEN 18 AND 23 THEN 'Evening'
		ELSE 'Night'
	END AS time_of_day,
	COUNT(*) as total_rides,
	AVG(r.customer_rating) as avg_customer_rating,
	COUNT(CASE WHEN r.customer_rating >= 4.5 THEN 1 END) as excellent_ratings,
	COUNT(CASE WHEN r.customer_rating >= 3.0 THEN 1 END) as poor_ratings
FROM rides r
JOIN zones z ON r.pickup_zone_id = z.zone_id
WHERE r.ride_status = 'completed' AND r.customer_rating IS NOT NULL
GROUP BY z.zone_type, time_of_day
ORDER BY z.zone_type, time_of_day;