select COUNT(*) as total_number_of_employees, department_id from hcm.employees
where department_id is not  -- can use COUNT(department_id)
group by department_id;
-- remove the is not null to get every department

select AVG(salary) as average_salary, department_id from hcm.employees
group by department_id
order by average_salary desc;
-- round: ROUND(AVG(salary), 2) as average_salary

select count(*) as total_number_of_products, warehouse_id, SUM(quantity_on_hand) as product_items from oes.inventories
group by warehouse_id
having SUM(quantity_on_hand) > 5000;

select MAX(date_of_count), locality as most_recent_date
from bird.antarctic_populations
group by locality;

select MAX(date_of_count), species_id, locality as most_recent_date
from bird.antarctic_populations
group by species_id, locality;
