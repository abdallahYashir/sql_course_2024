use SAMPLEDB
GO

select E1.employee_id, E1.first_name, E1.last_name, E2.first_name AS manager_first_name, E2.last_name AS manager_last_name from hcm.employees E1
full outer join hcm.employees E2 ON E1.manager_id = E2.employee_id;

select P.product_id, p.product_name, W.warehouse_id, W.warehouse_name, I.quantity_on_hand from oes.inventories I
inner join oes.products P on I.product_id = p.product_id
inner join oes.warehouses w on I.warehouse_id = W.warehouse_id;