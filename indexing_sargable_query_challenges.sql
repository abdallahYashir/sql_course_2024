use SAMPLEDB
GO

CREATE INDEX ix_warehouses_location ON oes.warehouses (location_id) INCLUDE (warehouse_name);

CREATE UNIQUE INDEX ix_unique_products_name ON oes.products (product_name);

SELECT
	order_id,
	order_date
FROM oes.orders
WHERE
	order_date >= '20190101' AND order_date <= '20191231';

-- fourth challenge
CREATE NONCLUSTERED INDEX ix_orders_shipped_date ON oes.orders (shipped_date) WHERE shipped_date IS NULL;

-- fifth challenge
SELECT
	customer_id, first_name, last_name, email, street_address
FROM oes.customers
WHERE first_name LIKE 'Vi%'
AND last_name = 'Jones';

CREATE NONCLUSTERED INDEX ix_customers_name ON oes.customers (first_name, last_name) INCLUDE (email, street_address);