-- Calculate customer loyalty and repeat business metrics
WITH customer_ride_counts AS (
	SELECT
		customer_id,
		COUNT(*) as ride_count,
		MIN(pickup_datetime) as first_ride,
		MAX(pickup_datetime) as last_ride
	FROM rides
	WHERE ride_status = 'completed'
	GROUP BY customer_id
)
SELECT 
	'Total Customers' AS metric,
	COUNT(*) AS value
FROM customer_ride_counts
UNION ALL
SELECT
	'Repeat Customers (2+ rides)' AS metric,
	COUNT(*) AS value
FROM customer_ride_counts
WHERE ride_count >= 2
UNION ALL
SELECT
	'Loyal Customers (5+ rides)' AS metric,
	COUNT(*) AS value
FROM customer_ride_counts
WHERE ride_count >= 5
UNION ALL
SELECT
	'Repeat Customer Rate %' AS metric,
	ROUND(
		(COUNT(CASE WHEN ride_count >= 2 THEN 1 END) * 100.0 / COUNT(*))
		) AS value
FROM customer_ride_counts;