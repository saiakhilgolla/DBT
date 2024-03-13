WITH female_customer_orders AS (
	SELECT
		order_id,
		user_id,
		status,
		gender,
		num_of_item
	FROM {{source('thelook_ecommerce', 'orders')}}
	WHERE gender = "F"
)
SELECT * FROM female_customer_orders
