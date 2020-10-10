FROM alpine:3.12

RUN apk add --no-cache nodejs nodejs-npm \
 && mkdir /.npm && chmod 777 /.npm \
 && npm install -g npm@latest
