
/* Selects required fields from orders table.
*/


with source_data as (

	SELECT
		order_id,
		customer_id,
		order_status,
		DATE(order_purchase_timestamp) as order_purchase_date
	FROM {{source('olig_ecommerce', 'orders')}}

)

select *
from source_data

