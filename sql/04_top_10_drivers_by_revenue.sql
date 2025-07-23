-- Identify highest performing drivers by revenue
SELECT 
	d.driver_id,
	d.driver_name,
	COUNT(r.ride_id) as total_rides,
	SUM(r.fare_amount + COALESCE(r.tip_amount, 0)) as total_revenue,
	AVG(r.fare_amount + COALESCE(r.tip_amount, 0)) as avg_revenue_per_ride,
	AVG(r.customer_rating) AS avg_customer_rating,
	AVG(r.distance_miles) as avg_trip_distance
FROM drivers d
JOIN rides r ON d.driver_id = r.driver_id
WHERE r.ride_status = 'completed' AND d.status = 'active'
GROUP BY d.driver_id, d.driver_name
ORDER BY total_revenue DESC
LIMIT 10;