la porta 80 container-side è mappata sulla porta 8080 host-side.
Per cui per collegarsi alla web app django è necessario andare su localhost:8080/admin
le cui credenziali sono id: mercurio password: hg80

La pagina di admin al primo avvio non funziona perché il database non è stato creato nel container che lo ospita, i passi da seguire sono i seguenti

Da terminale (Ubuntu):

sudo docker exec -d -i mysite3_web_1 /bin/bash (per accedere al filesystem del container)
su postgresql
psql
create database mydb;
create user myuser with password 'mypassword';
grant all privileges on database mydb to myuser;

riavviare entrambi i container. 
