-- Classify drivers into performance tiers based on ratings and ride count
SELECT
	d.driver_id,
	d.driver_name,
	COUNT(r.ride_id) AS total_rides,
	AVG(r.customer_rating) as avg_rating,
	SUM(r.fare_amount + COALESCE(r.tip_amount, 0)) as total_revenue,
	CASE
		WHEN AVG(r.customer_rating) >= 4.3 AND COUNT(r.ride_id) >= 50 THEN 'Gold'
		WHEN AVG(r.customer_rating) >= 4.25 AND COUNT(r.ride_id) >= 30 THEN 'Silver'
		WHEN AVG(r.customer_rating) >= 4.1 AND COUNT(r.ride_id) >= 20 THEN 'Bronze'
		ELSE 'Entry Level'
	END AS performance_tier
FROM drivers d
JOIN rides r ON d.driver_id = r.driver_id
WHERE r.ride_status = 'completed' AND d.status = 'active'
GROUP BY d.driver_id, d.driver_name
ORDER BY total_revenue DESC;