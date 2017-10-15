# php7-composer

This is just alpine with php7 and composer installed. For convenience bash, wget and git is also installed. You can use
it to install composer dependencies in your project:

```console
$ docker run --rm --user $(id -u) -v $(pwd):/app -w /app iras/php7-composer composer install
```
