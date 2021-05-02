# php8-composer

Alpine image with php8 and composer installed. You can use it to install composer dependencies in your project:

```console
$ docker run --rm --user $(id -u) -v $(pwd):/app -w /app iras/php8-composer composer install
```
