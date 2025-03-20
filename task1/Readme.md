For the 3nd task, I ve pulled and run a PostgreSQL container.

```powrshell
docker pull postgres

docker run --name pg-container -e POSTGRES_USER=ituser -e POSTGRES_PASSWORD=pass123 -e POSTGRES_DB=company_db -p 5432:5432 -d postgres
```

I have also ensured that the container is running
```powrshell
docker ps
```
![alt text](image.png)

Access Database container:
```powrshell
docker exec -it pg-container bash
psql -U ituser -d company_db
```


