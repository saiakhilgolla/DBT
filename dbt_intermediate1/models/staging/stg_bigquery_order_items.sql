
-- selects required fields from order_items table
WITH source AS (
	SELECT
		order_id,
		freight_value AS order_value
	FROM {{source('olig_ecommerce', 'order_items')}}
)
SELECT *
FROM source
