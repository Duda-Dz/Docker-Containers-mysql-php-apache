# 🐳 PROJETO: CONTEINERS MYSQL/PHP-APACHE EM DOCKER.

## 💡 Desafio Proposto Pela [Digital Innovation One](https://www.dio.me)
## 📘 SOBRE O PROJETO:
### Este projeto tem como objetivo a utilização de diversas ferramentas virtuais da AWS, Docker para conteinerização de bancos de dados MySQL e servidores PHP-APACHE, configuração de Docker Swarm, compartilhamento de arquivos com NFS e configuração de proxy utilizando NGINX. O projeto também incluiu a realização de testes de estresse no cluster.

## 🛠️ FERRAMENTAS UTILIZADAS:
![AWS](https://img.shields.io/badge/Amazon_AWS-232F3E?style=flat&logo=amazon-web-services&logoColor=white) ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=flat&logo=ubuntu&logoColor=white) ![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white) ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white) ![PHP](https://img.shields.io/badge/PHP-777BB4?style=flat&logo=php&logoColor=white) ![HTML](https://img.shields.io/badge/HTML-e34c26?style=flat&logo=html5&logoColor=white) ![Apache](https://img.shields.io/badge/Apache-D22128?style=flat&logo=Apache&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=flat&logo=nginx&logoColor=white) ![GIT](	https://img.shields.io/badge/GIT-E44C30?style=flat&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)

## 📦 Passos para clonar projeto:

### Para Copiar os Containers 
```sh
git clone https://github.com/Duda-Dz/Docker-Containers-mysql-php-apache.git

```

### Para Entrar no Repositório:
```sh
cd Docker-Containers-mysql-php-apache

```

### Para Atualizar:
```sh
apt upgrade -y

````

### Para Instalar o Vizualizador de Arquivos:
```sh
apt install tree

```

### Para Visualizar Estrutura do Projeto sem Arquivos Ocultos:
```sh
tree

```
```sh
.
├── Dockerfile.php
├── README.md
├── dados.sql
├── dockerfile
├── index.php
└── nginx.conf
```

### Para Visualizar Estrutura do Projeto com Arquivos Ocultos:
```sh
tree -a -L 2

```
```sh
.
├── .git
│   ├── HEAD
│   ├── branches
│   ├── config
│   ├── description
│   ├── hooks
│   ├── index
│   ├── info
│   ├── logs
│   ├── objects
│   ├── packed-refs
│   └── refs
├── Dockerfile.php
├── README.md
├── dados.sql
├── dockerfile
├── index.php
└── nginx.conf

```

### Instalar Docker:
```sh
apt install docker.io -y

```

### Subindo MySQL:
```sh
docker run -d \
 --name mysql-container \
-e MYSQL_ROOT_PASSWORD=root123 \
-e MYSQL_DATABASE=meubanco \
-e MYSQL_USER=ubuntu \
-e MYSQL_PASSWORD=senha123 \
-p 3306:3306 \
mysql:8.0

```

### Criar Diretorio Para Armazenar PHP-Apache:
```sh
mkdir php-apache

```

### Para Mover Arquivos PHP-Apache Para o Diretorio php-apache:
```sh
mv Dockerfile.php php-apache

```
```sh
mv index.php php-apache

```

### Para Renomear o Dockerfile.php em Dockerfile:
```sh
mv Dockerfile.php Dockerfile
```

### 📌 OBS: Criei o Dockerfile.php para ficar organizado os arquivos, porém é preciso transformar em somente 'Dockerfile', para que o projeto rode sem problemas.

### Criar Network:
```sh
docker network create meu-projeto-net

```

### Criar Imagem php-apache-app a Partir do Dockerfile:
```sh
docker build -t php-apache-app .

```

### Subindo PHP:
```sh
docker run -d \
  --name apache-php-container \
  -p 8080:80 \
  --network meu-projeto-net \
  php-apache-app

```

### Teste no Navegador Clicando no IP na AWS.

## 🚀 Passos a Passos do Inicio:

### Criando Máquinas Virtuais na AWS:
```md
1. Crie 3 Instâncias EC2 Ubuntu

```
```md
2. Libere as portas SSH (22), HTTP (80), MYSQL (3306), DOCKER SWARM (2377)

```

### Update na Máquina:
```sh
apt update -y

```

### 📌 FAÇA UPDATE NAS 3 INSTANCIAS

### Instalando Docker:

```sh
apt install docker.io -y

```

### 📌 INSTALE DOCKER NAS 3 INSTANCIAS 

### Instalando MySQL:
```sh
apt install mysql-server-8.0 -y

```

### 📌 INSTALE O MYSQL NAS 3 INSTANCIAS 

### Criando Arquivo dados.sql:
```sh
nano dados.sql

```
```sh
CREATE DATABASE dadosempresa;
USE dadosempresa;

CREATE TABLE users (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(100),
    Email varchar(100),
    Endereco varchar(150),
    Cidade varchar(100),
    Produto varchar(50),
    Host varchar(50)
);

INSERT INTO users (ClienteID, name, email, endereço, cidade, produto VALUES ('1', 'Julian Rodrigues', juliamrodrigues2235@gmail.com', 'QR 417, CONJUNTO H', 'BRASILIA-DF', 'Pote da Felicidade');

```

### 📌 CRIE O ARQUIVO DADOS.SQL NA INSTANCIA PRINCIPAL 

### Criar Diretorio Data Para Armazenamento:
```sh
mkdir data

```
```sh
cd data

```
```sh
mkdir _data

```
 
### Criar Diretorio App Para Armazenamento:
```sh
mkdir app

```
```sh
cd app

```
```sh
mkdir _data

```

### Criar Diretorio /app para Armazenamento:
```sh
mkdir /app

```

### 📌 CRIE OS DIRETORIOS NA INSTANCIA PRINCIPAL

### Para Habilitar o Serviço Docker:
```sh
systemctl enable docker

```

### Iniciar Serviço Docker:
```sh
systemctl start docker

```

### 📌 HABILITAR E INICIAR DOCKER NAS 3 INSTANCIAS 

### Criar Dockerfile MySQL:
```sh
nano Dockerfile

```
```sh
FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=D4d0ssql
COPY ./dados.sql /docker-entrypoint-initdb.d/

```

### 📌 CRIAR DOCKERFILE MYSQL NA INSTANCIA PRINCIPAL

### Construir uma Imagem por Meio do Dockerfile:
```sh
docker build -t mysql-container .

```

### Executar Container:
```sh
docker run -d --name mysql-dados -p 3306:3306 mysql-container

```

### 📌 CONSTRUA IMAGEM E EXECUTE O CONTEINER MYSQL NA INSTANCIA PRINCIPAL

### Testar Banco de Dados:
```sh
docker exec -it mysql-dados mysql -u root -p

```

### 📌 TESTE O BANCO DE DADOS NA INSTANCIA PRINCIPAL

### Criar Dockerfile PHP:
```sh
nano Dockerfile

```
```sh
FROM webdevops/php-apache:alpine-php7
COPY ./src/ /app/

```

### Criar index.php:
```sh
nano index.php

```
```sh
<html>

<head>
<title>CONTEINER PHP</title>
</head>
<body>

ini_set("display_errors", 1);
header('Content-Type: text/html; charset=iso-8859-1');



echo 'Versao Atual do PHP: ' . phpversion() . '<br>';

$servername = "107.22.109.32";
$username = "root";
$password = "Senha12345";
$database = "dadosempresa";

// Criar conexão


$link = new mysqli($servername, $username, $password, $database);

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

$valor_rand1 =  rand(1, 999);
$valor_rand2 = strtoupper(substr(bin2hex(random_bytes(5)), 1));
$host_name = gethostname();


$query = "INSERT INTO dados (ClienteID, Nome, Email, Endereco, Cidade, Produto, Host) VALUES ('$valor_rand1' , '$valor_rand2', '$valor_rand2', '$valor_rand2', '$valor_rand2', '$valor_rand2', '$host_name')";


if ($link->query($query) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $link->error;
}

</body>
</html>

```

### 📌 CRIAR DOCKERFILE PHP E INDEX.PHP NA INSTANCIA PRINCIPAL

### Criar Imagem PHP:
```sh
docker build -t php-apache .

```

### Executar Container:
```sh
docker run -d --name web-app -p 80:80 php-apache

```

### 📌 CRIAR IMAGEM PHP E EXECUTAR CONTAINER PHP NA INSTANCIA PRINCIPAL

### 🔥 Fazer teste de Estresse:
```md
1. Abrir o site loader.io

```
```md
2. criar conta e clicar em teste

```
```md
3. colocar ip com a extensão http

```

### 🔥 O Loader.io vai passar um código 

### 🔥 Na Instancia Principal vai Armazenar o Código:
```sh
nano código

```
```sh
colar código

```

### 🔥 Voltar no site, vão dar confirmação que os containers estarão online, e então é so fazer o teste de strees 

### 📌 FAZER OS PROCESSOS DE TESTE DE STRESS NA INSTANCIA PRINCIPAL

### Iniciando o Swarm na Instancia Principal:
```sh
docker swarm init --advertise-addr Ip-Privado-Da-Instancia-Principal

```

### Adicionando Instancia 2 como Worker:
```md
1. Na instancia 2 cole o swarm da instancia principal

```
```sh
docker swarm init --advertise-addr Ip-Privado-Da-Instancia-Principal

```

### Adicionando Instancia 3 como Worker:
```md
1. Na instancia 3 cole o swarm da instancia principal

```
```sh
docker swarm init --advertise-addr Ip-Privado-Da-Instancia-Principal

```

### Criando Serviço:
```sh
docker service create --name web-server --replicas 3 -dt -p 80:80 \
--mount type=volume,src=app,dst=/app/ webdevops/php-apache:alpine-php7

```
### 📌 CRIAR SERVIÇO NA INSTANCIA PRINCIPAL

### Listar Serviços em Execução:
```sh
docker service ls

```

### Ver Containers web-server:
```sh
docker service ps web-server

```
### 📌 LISTAR SERVIÇO E VER CONTAINER WEB-SERVER PODE FAZER NAS 3 INSTANCIAS SE DESEJAR

### Instalar nfs-kernel-server na Instancia Principal (instancia Leader):
```sh
apt install nfs-kernel-server -y

```

### Instalar nfs-common na Instancia 2 (Instancia Worker):
```sh
apt install nfs-common -y

```

### Instalar nfs-common na Instancia 3 (Instancia Worker):
```sh
apt install nfs-common -y

```

### Adicionar Compartilhamento na Instancia Principal:
```sh
nano /etc/exports

```
```sh
/app ip-Instancia-2(rw,sync,no_subtree_check) ip-instancia-3(rw,sync,no_subtree_check)

```

### Montar um Diretorio Exportado via NFS na Instancia 2:
```sh
mount -t nfs ip-instancia-principal:/app /app

```

### Montar Compartilhamento Automaticamente no Boot na Instancia 2:
```sh
nano /etc/fstab/

```
```sh
ip-instancia-principal:/app /app nfs defaults 0 0

```
### Montar um Diretorio Exportado via NFS na Instancia 3:
```sh
mount -t nfs ip-instancia-principal:/app /app

```

### Montar Compartilhamento Automaticamente no Boot na Instancia 3:
```sh
nano /etc/fstab/

```
```sh
ip-instancia-principal:/app /app nfs defaults 0 0

```

### Executar Compartilhamento via Instancia Principal:
```sh
exportfs -ar

```

### Criar nginx.conf:
```sh
nano nginx.conf

```
```sh
http {
   
    upstream all {
        server 172.31.92.178:80;
        server 172.31.84.110:80;
        server 172.31.83.250:80;
    }

    server {
         listen 4500;
         location / {
              proxy_pass http://all/;
         }
    }

}


events { }

```

### Subir Container nginx.conf:
```sh
docker run -d --name nginx-lb -p 80:80 -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf nginx

```
### 📌 CRIAR NGINX E SUBIR CONTAINER NGINX NA INSTANCIA PRINCIPAL

### 🔥 Fazer o Processo de Teste de Estresse Novamente






















 

