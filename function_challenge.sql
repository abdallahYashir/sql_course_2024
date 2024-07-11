use SAMPLEDB
GO

SELECT
	LEFT(scientific_name, CHARINDEX(' ', scientific_name) - 1) as genus_name
FROM bird.antarctic_species

-- fourth challenge
SELECT
	scientific_name
	SUBSTRING(scientific_name, CHARINDEX(' ', scientific_name) + 1, LEN(scientific_name)) AS species_name
FROM bird.antarctic_species

-- fifth challenge
SELECT 
	employee_id,
	first_name,
	last_name,
	birth_date,
	DATEDIFF(year, birth_date, CURRENT_TIMESTAMP) as employee_age
FROM hcm.employees

-- sixth challenge: estimated shipping date
SELECT
	order_id,
	order_date,
	DATEADD(day, 7, order_date) AS estimated_shipping_date
FROM oes.orders
WHERE shipped_date IS NULL;

-- final challenge: average shipping days
SELECT
	s.company_name,
	AVG(DATEDIFF(day, o.order_date, o.shipped_date)) AS avg_shipping_days
FROM oes.orders o
INNER JOIN oes.shippers s
ON o.shipper_id = s.shipper_id
GROUP BY s.company_name;
