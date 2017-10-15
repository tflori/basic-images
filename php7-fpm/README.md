# php7-fpm

Alpine image with php7 and fpm installed. Use this to build your php server image or run your dev environment directly
from this image:

```console
$ docker run --rm -ti -e UID=$(id -u) -v $(pwd):/var/www/localhost iras/php7-fpm
```
