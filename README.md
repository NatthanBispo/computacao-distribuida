# computacao-distribuida-front

> Github Api: https://github.com/NatthanBispo/computacao-distribuida

> Docker Hub
  [Api](https://hub.docker.com/r/nathanbispo/computacao-distribuida-api),
  [Front](https://hub.docker.com/r/nathanbispo/computacao-distribuida-front)

> [Documentação Postman](https://documenter.getpostman.com/view/8120581/UVBznUmU)

## Config Docker (DB, Api, Front)
### Mysql
```docker
$ docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=computacao_distribuida_development -d -p 3306:3306 mysql:8.0.26 --default-authentication-plugin=mysql_native_password 
```

> Para a configuração da Api e do Front é necessario seu endereço de ip local. [Como descobrir meu endereço de ip?](https://canaltech.com.br/internet/como-descobrir-o-numero-de-ip-externo-e-local/)
## Api

### **Criar container**
```docker
$ docker run --name api -e DATABASE_HOST=[YOUR_HOST] -d -p 3000:3000 nathanbispo/computacao-distribuida-api:latest
```

> *docker run --name api -e DATABASE_HOST=**192.168.15.8** -d -p 3000:3000 nathanbispo/computacao-distribuida-api:latest*

Depois que o container for criado é necessario rodar as migration:
```bash
$ docker exec api rake db:migrate
```

## Front
### **Criar container**
```docker
$ docker run --name front -e VUE_APP_API_URL=http://[YOUR_HOST]:3000 -d -p 8080:8080 nathanbispo/computacao-distribuida-front:latest
```

> *docker run --name front -e VUE_APP_API_URL=http://**192.168.15.8**:3000 -d -p 8080:8080 nathanbispo/computacao-distribuida-front:latest*

Depois que o container for criado é necessario buildar o VueJs:
```bash
$ docker exec front npm run build
```