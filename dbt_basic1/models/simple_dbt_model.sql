WITH male_customer_orders AS (
	SELECT
		order_id,
		user_id,
		status,
		gender,
		num_of_item
	FROM `bigquery-public-data.thelook_ecommerce.orders`
	WHERE gender = "M"
)
SELECT * FROM male_customer_orders