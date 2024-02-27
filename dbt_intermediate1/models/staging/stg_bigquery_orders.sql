
/* Selects required fields from orders table.
*/


with source_data as (

	SELECT
		order_id,
		customer_id,
		order_status,
		DATE(order_purchase_timestamp) as order_purchase_date,
		DATE(MAX(order_purchase_timestamp) OVER()) AS max_date
	FROM {{source('olig_ecommerce', 'orders')}}
	WHERE order_purchase_timestamp >= '2017-01-01'
)

select *
from source_data

