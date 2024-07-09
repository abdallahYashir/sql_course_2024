use SAMPLEDB
GO

select * from hcm.employees
where city in ('Seattle', 'Sydney');

select * from hcm.employees
where city = 'Seattle' OR city = 'Sydney';

