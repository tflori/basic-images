# php5-composer

This is just alpine with php5 and composer installed. You can use it to install composer dependencies in your project:

```console
$ docker run --rm --user $(id -u) -v $(pwd):/app -w /app iras/php5-composer composer install
```
