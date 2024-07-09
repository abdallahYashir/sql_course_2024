-- challenge
use SAMPLEDB
GO

-- using where
select product_id, product_name, category_id, list_price 
from oes.products p1
where list_price = (
	select MIN(list_price) from oes.products p2
	where p1.product_id = p2.product_id
)

-- another variant: much simpler
select product_id, product_name, category_id, list_price 
from oes.products p1
where list_price = (
	select MIN(list_price) 
	from oes.products
)

-- another variation is using TOP and order by price ASC

-- using inner join subquery
SELECT p1.product_id, product_name, category_id, list_price FROM oes.products p1
INNER JOIN (
	SELECT product_id, MIN(list_price) as min_price from oes.products GROUP BY product_id
) p2
ON p1.product_id = p2.product_id
AND p1.list_price = p2.min_price;

-- second challenge
select product_id, product_name, category_id, list_price 
from oes.products p1
where list_price = (
	select MIN(list_price) from oes.products p2
	where p1.category_id = p2.category_id
)

-- third challenge: using inner join subquery
SELECT p1.product_id, product_name, p1.category_id, list_price 
FROM oes.products p1
INNER JOIN (
    SELECT category_id, MIN(list_price) as min_price
    FROM oes.products GROUP BY category_id
) p2
ON p1.category_id = p2.category_id
AND p1.list_price = p2.min_price;

-- fourth challenge: using CTE
WITH min_price_per_category AS (
    SELECT category_id, MIN(list_price) as min_price
    FROM oes.products GROUP BY category_id
)
SELECT p1.product_id, product_name, p1.category_id, list_price
FROM oes.products p1
JOIN min_price_per_category p2 ON p1.category_id = p2.category_id
AND p1.list_price = p2.min_price;

-- fifth challenge: include oes.product_categories
WITH min_price_per_category AS (
    SELECT category_id, MIN(list_price) as min_price
    FROM oes.products GROUP BY category_id
)
SELECT p1.product_id, product_name, p1.category_id, list_price, pc.category_name
FROM oes.products p1
JOIN min_price_per_category p2 ON p1.category_id = p2.category_id
JOIN oes.product_categories pc ON p1.category_id = pc.category_id
AND p1.list_price = p2.min_price;

-- sixth challenge
SELECT employee_id, first_name, last_name
FROM hcm.employees
WHERE employee_id NOT IN (
	SELECT employee_id
	FROM oes.orders
	WHERE employee_id IS NOT NULL
)

-- seventh challenge: use where not exists instead
SELECT employee_id, first_name, last_name
FROM hcm.employees e
WHERE NOT EXISTS (
	SELECT *
	FROM oes.orders o
	WHERE o.employee_id = e.employee_id
)

-- eight challenge
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM oes.customers c
WHERE customer_id IN (
	SELECT O.customer_id
	FROM oes.orders O
	JOIN oes.order_items OI ON OI.order_id = O.order_id
	JOIN oes.products P ON P.product_id = OI.product_id
	WHERE P.product_name = 'PBX Smart Watch 4'
)