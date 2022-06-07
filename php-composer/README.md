# php-composer

Ubuntu image with php7 and composer installed. You can use it to install composer dependencies in your project:

```console
$ docker run --rm --user $(id -u) -v $(pwd):/app -w /app iras/php-composer:ubuntu-7.4 composer install
```

**NOTE** it is recommended to pass/change the user as the files are from root otherwise.

## Usage in Docker-Compose Environments

When using it for local docker-compose environments I recommend to create a .env and add your user ID to it.

Example xdebug.ini:

```ini
PUID=1000
```

Example docker-compose.yml:

```yaml
services:
  composer:
    image: iras/php-composer:ubuntu-7.4
    user: "${PUID-1000}"
    working_dir: "/app"
    entrypoint: /usr/bin/composer
    command: help # a dummy command to not waste time with every start
    volumes:
      - "./:/app"
      - "./storage/cache/composer:/composer/cache"
```

Now you can execute composer like that:

```console
$ docker compose run --rm composer install
$ docker compose run --rm composer update
$ docker compose run --rm composer require tflori/orm
```
