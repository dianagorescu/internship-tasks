For the 3nd task, I ve pulled and run a PostgreSQL container.

```powrshell
docker pull postgres

docker run --name pg-container -e POSTGRES_USER=ituser -e POSTGRES_PASSWORD=pass123 -e POSTGRES_DB=company_db -p 5432:5432 -d postgres
```

I have also ensured that the container is running
```powrshell
docker ps
```
![image](https://github.com/user-attachments/assets/450a796a-7537-4e68-a70f-48e304a60ccc)

- Access Database container
```powrshell
docker exec -it pg-container bash
psql -U ituser -d company_db
```

- Import dataset
```powrshell
psql -U ituser -d company_db -f populatedb.sql
```

- SQL QUERIES
1. Find the total number of employees.
```sql
select count(*) as total_number_employees
from employees;
```
![image](https://github.com/user-attachments/assets/3f69c1cc-daf0-46fb-b72a-a31be1d569d7)

   
2. Retrieve the names of employees in a specific department (prompt for user input).
```sql
\prompt 'Enter department name: ' department_name

select e.first_name || ' ' || e.last_name as full_name
from employees e
join departments d on d.department_id = e.department_id
where lower(d.department_name) = lower(:'department_name');
```
![image](https://github.com/user-attachments/assets/0f94d419-6e87-4dd4-936f-99bcf7641edb)

   
3. Calculate the highest and lowest salaries per department.
```sql
select d.department_name, max(s.salary) as highest, min(s.salary) as lowest
from salaries s
join employees e on e.employee_id = s.employee_id
join departments d on d.department_id = e.department_id
group by d.department_name;
```
Here, I found out the table SALARIES was null. I investigated and caught the error from inserting data.
![image](https://github.com/user-attachments/assets/f44bb1ca-d7d5-4982-b8e6-6538f1e2ad2f)

So, I manually inserted the first 53 rows, as the others (54th >=) violated FK constraint (there are only 53 employee_ids). 
![image](https://github.com/user-attachments/assets/74e4a325-c9d5-44b4-9f4c-0b1143ead68d)

- Dump the dataset into a file
```powrshell
pg_dump -U ituser -d company_db -F p > company_db.sql
```
- The Bash script
For running the script
```powrshell
chmod +x script.sh
./script.sh
```

