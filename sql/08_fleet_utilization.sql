-- Calculate how efficiently the fleet is being utilized
WITH daily_active_drivers AS (
	SELECT
		DATE(pickup_datetime) AS ride_date,
		COUNT(DISTINCT driver_id) AS active_drivers,
		COUNT(*) AS total_rides
	FROM rides
	WHERE ride_status = 'completed'
	GROUP BY DATE(pickup_datetime)
),
total_drivers AS (
SELECT COUNT(*) AS total_active_drivers
FROM drivers
WHERE status = 'active'
)
SELECT
	d.ride_date,
	d.active_drivers,
	t.total_active_drivers,
	ROUND((d.active_drivers * 100.0 / t.total_active_drivers), 2) AS utlitization_rate_percent,
	d.total_rides,
	ROUND(d.total_rides / d.active_drivers, 2) AS avg_rides_per_active_driver
FROM daily_active_drivers d
CROSS JOIN total_drivers t
ORDER BY d.ride_date;