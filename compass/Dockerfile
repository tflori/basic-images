FROM alpine:3.10

RUN apk add --no-cache ruby ruby-dev libffi libffi-dev build-base \
 && gem install --no-document compass \
 && apk del --no-cache ruby-dev libffi-dev build-base \
 && rm -rf /usr/lib/ruby/gems/*/cache/*
 
 ENTRYPOINT
