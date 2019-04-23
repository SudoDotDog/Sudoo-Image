FROM alpine:3.9

RUN mkdir /app
WORKDIR /app

RUN apk add --update nodejs yarn
