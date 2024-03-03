{% test rows_are_identical(model, column_name) %}

WITH validation AS (
	SELECT
		COUNT (DISTINCT {{column_name}}) as number_of_unique_values
	FROM {{ref('stg_bigquery_orders')}}
)
SELECT *
FROM validation
WHERE number_of_unique_values > 1

{% endtest %}