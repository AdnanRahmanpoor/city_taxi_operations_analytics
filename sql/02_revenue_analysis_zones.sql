-- Compare revenue performance across different zones
SELECT
	z.zone_type,
	COUNT(r.ride_id) as total_rides,
	SUM(r.fare_amount + COALESCE(r.tip_amount, 0)) as total_revenue,
	AVG(r.fare_amount + COALESCE(r.tip_amount, 0)) as average_revenue_per_ride,
	AVG(r.distance_miles) as avg_distance,
	AVG(r.customer_rating) as avg_customer_rating
FROM rides r
JOIN zones z ON r.pickup_zone_id = z.zone_id
WHERE r.ride_status = 'completed'
GROUP BY z.zone_type
ORDER BY total_revenue DESC;