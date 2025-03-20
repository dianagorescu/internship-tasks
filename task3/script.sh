#!/bin/bash

echo "Verify existence of database"
psql -U ituser -d postgres -c "DROP DATABASE IF EXISTS company_db;"

echo "Creating database"
psql -U ituser -d postgres -c "CREATE DATABASE company_db OWNER ituser;"

echo "Creating second admin"
psql -U ituser -d postgres -c "CREATE ROLE admin_cee WITH LOGIN SUPERUSER PASSWORD 'pass1234';"

# Importing dataset
psql -U ituser -d company_db -f company_db.sql

# Executing the 3 queries

echo "task 1"
psql -U ituser -d company_db -c "select count(*) as total_number_employees from employees;" > /var/log/db_setup.log

echo "task 2"
echo "Enter department name:"
read department_name
psql -U ituser -d company_db -c "
select e.first_name || ' ' || e.last_name as full_name
from employees e
join departments d on d.department_id = e.department_id
where lower(d.department_name) = lower('$department_name');" >> /var/log/db_setup.log

echo "task 3"
psql -U ituser -d company_db -c "
select d.department_name, max(s.salary) as highest, min(s.salary) as lowest
from salaries s
join employees e on e.employee_id = s.employee_id
join departments d on d.department_id = e.department_id
group by d.department_name;" >> /var/log/db_setup.log
