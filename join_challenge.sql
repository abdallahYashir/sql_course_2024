select E.employee_id, E.first_name, E.last_name, E.salary, D.department_name from hcm.employees E
join hcm.departments D on E.department_id = D.department_id;

select E.employee_id, E.first_name, E.last_name, E.salary, D.department_name from hcm.departments D
join hcm.employees E on E.department_id = D.department_id;

