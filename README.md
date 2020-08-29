# MultiContainer - Laravel/Nginx

Setup para construir containers de laravel

O ideal é ter as images já com build no Docker Hub e apenas atualizarem, porém pode ser usando dentro do projeto do Laravel

## Installation

Tendo docker e docker compose instalada, rode o comando abaixo sempre que precisar atualizar os containers

```bash
docker-compose up --force-recreate -d
```

Caso seja feito alguma mudança no arquivo ngix.conf, rode:

```bash
docker-compose up --force-recreate -d --no-deps --build nginx
```

Para parar os container:

```bash
docker-compose down
```
