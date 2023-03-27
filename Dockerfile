FROM alpine:3.7

RUN apk --update --no-cache add git openssh-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]