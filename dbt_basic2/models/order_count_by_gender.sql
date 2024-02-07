{{config(materialized='table')}}

WITH user_info AS (
	SELECT
		country,
		state,
		gender,
		id
	FROM {{source('thelook_ecommerce', 'users')}}
)
SELECT
	user_info.country,
	user_info.state,
	user_info.gender,
	count(orders.order_id) as num_orders
FROM user_info
LEFT JOIN {{source('thelook_ecommerce', 'orders')}} as orders
ON user_info.id = orders.user_id
GROUP BY
	user_info.country,
	user_info.state,
	user_info.gender
