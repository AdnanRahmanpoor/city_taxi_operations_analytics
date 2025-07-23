-- Analyze customer feedback patterns and categories
SELECT
	cf.feedback_category,
	cf.rating,
	COUNT(*) AS feedback_count,
	COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS percentage,
	AVG(r.fare_amount) AS avg_fare_for_category
FROM customer_feedback cf
JOIN rides r ON cf.ride_id = r.ride_id
GROUP BY cf.feedback_category, cf.rating
ORDER BY cf.feedback_category, cf.rating DESC;