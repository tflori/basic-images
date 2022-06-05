# basic-images

Basic Docker Images for private or commercial usage. The usual way is to build own images based on this images.

## Overview

In this readme there is only an overview which images exists. Each image has his own readme with more details how to
use and modify this image.

* [php](php) - a basic image for php that just installed the php versions from package managers including a bunch of  
  typical modules
* [php-composer](php-composer) - based on the php image just with composer installed
* [php-fpm](php-fpm) - based on the php image but with fpm installed
* [nginx](nginx) - a basic image for nginx 1.12 based on alpine
* [apache](apache) - a basic image for apache 2.4 based on alpine

**NOTE** all images are using x86_64 architecture.

**NOTE** don't use the latest version it exists for compatibility. You never know what version you get as we can't know
in the CI script if it is the latest version we push with every build a tag latest and when we just fixed php 7.3 that
is php 7.3 even if 8.1 is the latest version.
