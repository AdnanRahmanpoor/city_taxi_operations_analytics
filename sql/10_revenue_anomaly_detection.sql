-- Purpose: Identify days with unusually high or low revenue (±2 standard deviations)
WITH daily_revenue AS (
    SELECT 
        DATE(pickup_datetime) AS ride_date,
        SUM(fare_amount + COALESCE(tip_amount, 0)) AS daily_revenue
    FROM rides
    WHERE ride_status = 'completed'
    GROUP BY DATE(pickup_datetime)
),
revenue_stats AS (
    SELECT 
        AVG(daily_revenue) AS avg_revenue,
        -- Variance = AVG(x^2) - AVG(x)^2
        AVG(daily_revenue * daily_revenue) - AVG(daily_revenue) * AVG(daily_revenue) AS variance,
        -- Standard deviation = sqrt(variance)
        SQRT(AVG(daily_revenue * daily_revenue) - AVG(daily_revenue) * AVG(daily_revenue)) AS stddev_revenue
    FROM daily_revenue
)
SELECT 
    dr.ride_date,
    dr.daily_revenue,
    rs.avg_revenue,
    ROUND((dr.daily_revenue - rs.avg_revenue) / rs.stddev_revenue, 2) AS z_score,
    CASE 
        WHEN ABS((dr.daily_revenue - rs.avg_revenue) / rs.stddev_revenue) > 2 THEN 'Anomaly'
        WHEN ABS((dr.daily_revenue - rs.avg_revenue) / rs.stddev_revenue) > 1.5 THEN 'Notable'
        ELSE 'Normal'
    END AS status
FROM daily_revenue dr
CROSS JOIN revenue_stats rs
ORDER BY ABS((dr.daily_revenue - rs.avg_revenue) / rs.stddev_revenue) DESC;