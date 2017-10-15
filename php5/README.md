# php5

This is just alpine with php5 installed. You can use it to run your php scripts:

```console
$ docker run --rm iras/php5 php --version
$ docker run --rm iras/php5 php -m
$ docker run --rm iras/php5 php -i
$ docker run --rm -v $(pwd):/app iras/php5 php /app/cli.php
```

The only extension installed and not enabled is the xdebug extension. When you need it in your image you could start
your Dockerfile like this:

```Dockerfile
FROM iras/php5

RUN echo 'zend_extension=xdebug.so' >> /etc/php5/conf.d/xdebug.ini
```
