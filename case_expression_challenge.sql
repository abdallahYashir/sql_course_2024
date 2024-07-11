use SAMPLEDB
GO

SELECT
	product_id,
	product_name,
	discontinued,
	CASE discontinued
		WHEN 0 THEN 'No'
		WHEN 1 THEN 'Yes'
	ELSE 'unknown'
	END AS discontinued_description
FROM
	oes.products;

