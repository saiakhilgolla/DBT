WITH source AS (
	SELECT
		COUNT (DISTINCT max_date) as unique_max_dates
	FROM {{ref('stg_bigquery_orders')}}

)
SELECT *
FROM source
WHERE unique_max_dates > 1

