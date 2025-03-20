### 1. Lookup the Public IP of cloudflare.com
```powrshell
apt update && apt install -y dnsutils
dig cloudflare.com
```
![image](https://github.com/user-attachments/assets/55b13ec1-1a33-41e5-85a6-608367c66638)

Most of the tools for solving the tasks were not installed, so I had to install them on the container.
For instance: dig, ping, nano, telnet, netstat, curl


### 2. Map IP address 8.8.8.8 to hostname google-dns

For this task, I had to modify the hosts file by adding **8.8.8.8**  **google-dns**. For verifying, I used ping command.
```powrshell
apt update && apt install -y nano
nano etc/hosts

apt update && apt install -y iputils-ping
ping google-dns
```
![image](https://github.com/user-attachments/assets/eae0ec66-8679-4c4c-8d8d-e876709a8e41)

### 3. Check if the DNS Port is Open for google-dns

DNS Port means UDP port 53, so I used **telnet** to check conectivity. The DNS port is open.
```powrshell
apt update && apt install -y telnet
telnet 8.8.8.8 53
```
![image](https://github.com/user-attachments/assets/ca8f7ac4-bbd6-43e3-91d4-f913d58d0488)


### 4. Modify the System to Use Google’s Public DNS

I modified the /etc/resolv.conf file by changing the default nameserver.
```powrshell
nano /etc/resolv.conf
```
![image](https://github.com/user-attachments/assets/e869a76e-2510-4292-b6e1-0e53c703a2f5)

Comparation: (server have been modified)
```powrshell
dig cloudflare.com
```
![image](https://github.com/user-attachments/assets/0e28be83-ea6e-4301-98ce-37ed8516451d)

### 5. Install and verify that Nginx service is running
```powrshell
apt update && apt install -y nginx
service nginx start
service nginx status
```

![image](https://github.com/user-attachments/assets/660d251e-2dcb-4427-9278-c95fcfcefe78)

### 6. For finding the Listening Port for Nginx, I used netstat -tulpn.
The flags means finding all **tcp** (-t), **udp** (-u), **open**(-p) and **listening** (-l) **ports**(-n, not service names)
```powrshell
netstat -tulpn | grep nginx
```
![image](https://github.com/user-attachments/assets/6b918b24-3e06-448d-ba5c-f105a48ff811)

### 7. Bonus

Default Nginx Listening Port is 80, so I modified it in the default file.
```powrshell
nano /etc/nginx/sites-available/default
```
![image](https://github.com/user-attachments/assets/b593895d-a500-4fed-a3fb-b5a721fc5c5e)
For verification, I tested errors, restarted and investigated with netstat command
```powrshell
nginx -t
service nginx restart
netstat -tulpn | grep nginx
```
![image](https://github.com/user-attachments/assets/b3b9dcf4-57b9-493a-a8bd-40ac27384dce)

Port 8080 of the server is accessible.
```powrshell
apt install -y curl
curl -I http://localhost:8080
```
![image](https://github.com/user-attachments/assets/fccfd905-2a61-4474-8680-ebd902ecf913)

For the last task, I modified the title field from the index.nginx-debian.html file
```powrshell
nano /var/www/html/index.nginx-debian.html
```
![image](https://github.com/user-attachments/assets/a3ff9aee-ab26-4ccd-8d50-76232896bc6a)



