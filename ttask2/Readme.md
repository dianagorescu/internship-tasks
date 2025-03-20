For the 2nd task, I ve chosen the python file. I have created a basic Dockerfile structure and filled in the fields to set up the environment and dependencies for the app..

```dockerfile
FROM python:3.10-slim
WORKDIR /ttask2
COPY calculator.py requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8080
CMD ["python", "calculator.py"]
```

I have also ensured that application runs on port 8080.
```python
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

Local Testing:
 - building the docker image locally
```powershell
docker build -t dianagorescu/calculator .
```

- testing the Dockerized application
```powershell
docker run -p 8080:8080 dianagorescu/calculator
```
Access http://localhost:8080 and testing the interface

![image](https://github.com/user-attachments/assets/30dee0ca-e534-4cc5-bd4e-74388ca53323)
![image](https://github.com/user-attachments/assets/f8d1cace-273a-4e1c-bb53-9ae9ffb16055)
![image](https://github.com/user-attachments/assets/9a0fa5c9-cd6e-4b63-9615-2c7b2b1f263a)

For the automation part I created an yml file in .github/workflows/, having mandatory steps to connect with Docker Hub account.




