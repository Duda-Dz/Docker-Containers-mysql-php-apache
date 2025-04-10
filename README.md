# PROJETO CONTEINERS MYSQL/PHP-APACHE EM DOCKER.

## Desafio Proposto Pela [Digital Innovation One](https://www.dio.me)
## SOBRE O PROJETO:
### Este projeto tem como objetivo a utilização de diversas ferramentas virtuais da AWS, Docker para conteinerização de bancos de dados MySQL e servidores PHP-APACHE, configuração de Docker Swarm, compartilhamento de arquivos com NFS e configuração de proxy utilizando NGINX. O projeto também incluiu a realização de testes de estresse no cluster.

## TECNOLOGIAS UTILIZADAS:
![AWS](https://img.shields.io/badge/Amazon_AWS-232F3E?style=flat&logo=amazon-web-services&logoColor=white) ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=flat&logo=ubuntu&logoColor=white) ![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white) ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white) ![PHP](https://img.shields.io/badge/PHP-777BB4?style=flat&logo=php&logoColor=white) ![HTML](https://img.shields.io/badge/HTML-e34c26?style=flat&logo=html5&logoColor=white) ![Apache](https://img.shields.io/badge/Apache-D22128?style=flat&logo=Apache&logoColor=white) ![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=flat&logo=nginx&logoColor=white) ![GIT](	https://img.shields.io/badge/GIT-E44C30?style=flat&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)

## Passos para clonar projeto:

### Para Copiar os Containers 
```sh
git clone https://github.com/Duda-Dz/Docker-Containers-mysql-php-apache.git

```
### Para Entrar no Repositório:
```sh
cd Docker-Containers-mysql-php-apache

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
### Subindo MySQL:
```sh
 sudo docker run -d \
 --name mysql-container \
-e MYSQL_ROOT_PASSWORD=root123 \
-e MYSQL_DATABASE=meubanco \
-e MYSQL_USER=ubuntu \
-e MYSQL_PASSWORD=senha123 \
-p 3306:3306 \
mysql:8.0

```
### Subindo PHP:
```sh
sudo docker run -d \
  --name apache-php-container \
  -p 8080:80 \
  --network mysql-container:mysql \
  php-apache-app

```

### Teste no Navegador Clicando no IP na AWS.









 

