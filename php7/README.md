# php7

This is just alpine with php7 installed. You can use it to run your php scripts:

```console
$ docker run --rm iras/php7 php --version
$ docker run --rm iras/php7 php -m
$ docker run --rm iras/php7 php -i
$ docker run --rm -v $(pwd):/app iras/php7 php /app/cli.php
```

The only extension installed and not enabled is the xdebug extension. When you need it in your image you could start
your Dockerfile like this:

```Dockerfile
FROM iras/php7

RUN echo 'zend_extension=xdebug.so' >> /etc/php7/conf.d/xdebug.ini
```

