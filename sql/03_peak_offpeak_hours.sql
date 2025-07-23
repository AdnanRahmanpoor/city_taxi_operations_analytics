-- Analyze revenue patterns during different times of day
SELECT
	CASE
		-- USE EXTRACT(HOUR FROM pickup_datetime) in MYSQL 
		WHEN CAST(strftime('%H', pickup_datetime) AS INTEGER) IN (7, 8, 9, 17, 18, 19) THEN 'Peak Hours'
		WHEN CAST(strftime('%H', pickup_datetime) AS INTEGER) BETWEEN 22 AND 23 
		OR	CAST(strftime('%H', pickup_datetime) AS INTEGER) BETWEEN 0 AND 6 THEN 'Late Night'
		ELSE 'Off-Peak Hours'
	END as time_periods,
	COUNT(*) as total_rides,
	SUM(fare_amount + COALESCE(tip_amount, 0)) as total_revenue,
	AVG(fare_amount + COALESCE(tip_amount, 0)) as avg_revenue_per_ride,
	AVG(customer_rating) as avg_rating
FROM rides
WHERE ride_status = 'completed'
GROUP BY time_periods
ORDER BY total_revenue DESC;
			