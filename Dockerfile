FROM fluent/fluentd

# Use root account to use apk
USER root

ENV TZ=America/Sao_Paulo
# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev  \
 && sudo gem install \
        fluent-plugin-elasticsearch \
 && sudo gem install fluent-plugin-s3 -v 1.0.0 --no-document \
 && sudo gem sources --clear-all \
 && apk add tzdata \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem
