-- Track daily revenue trends with 7D-SMA
SELECT
	DATE(pickup_datetime) as ride_date,
	SUM(fare_amount + COALESCE(tip_amount, 0)) as daily_revenue,
	AVG(SUM(fare_amount + COALESCE(tip_amount, 0)))
		OVER (ORDER BY DATE(pickup_datetime)
			ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as sma_7_days,
	COUNT(*) as total_rides
FROM rides
WHERE ride_status = 'completed'
GROUP BY DATE(pickup_datetime)
ORDER BY ride_date;