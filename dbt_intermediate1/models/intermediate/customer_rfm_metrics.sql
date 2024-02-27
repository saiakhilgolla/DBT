WITH source_data AS (
	SELECT
		customer_id,
		COUNT(DISTINCT t0.order_id) AS total_orders,
		AVG(t1.order_value) AS avg_order_value,
		MAX(order_purchase_date) AS last_purchase_date
	FROM {{ref('stg_bigquery_orders')}} AS t0
	INNER JOIN {{ref('stg_bigquery_order_items')}} AS t1
	ON t0.order_id = t1.order_id
	GROUP BY customer_id
)
SELECT * FROM source_data