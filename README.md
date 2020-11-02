# Vodan - MySQL

## Requisitos

* Docker <https://docs.docker.com/get-docker/>

## Executar serviços

Para executar o banco de dados mysql na porta 3306 e o phpmyadmin na porta 8080, basta executar o seguinte comando no terminal:

```console
docker-compose up
```

## Acessando o banco de dados com o phpmyadmin

Em seu navegador, acessar a url <http://localhost:8080> e entrar com usuário **root** e senha **abc123**.

## Utilizando a imagem em seu docker-compose

```yaml
version: "3"

services:
  mysql-db:
    image: josehisse/vodan-mysql:{TAG}
    environment:
      MYSQL_DATABASE: project_vodan
      MYSQL_ROOT_PASSWORD: abc123
    ports:
      - 3306:3306
    volumes:
      - ./mysql-db-store/:/var/lib/mysql
  phpmyadmin:
    image: phpmyadmin/phpmyadmin:4.9
    environment:
      PMA_HOST: mysql-db
    ports:
      - 8080:80
    depends_on:
      - mysql-db
```
