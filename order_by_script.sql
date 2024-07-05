USE SAMPLEDB
GO

select * from hcm.employees
order by last_name ASC;

select * from hcm.employees
order by last_name DESC;

select * from hcm.employees
order by last_name ASC, first_name DESC;

-- highest salary first
select * from hcm.employees
order by salary DESC;

-- most recently hired first
select * from hcm.employees
order by hire_date DESC;