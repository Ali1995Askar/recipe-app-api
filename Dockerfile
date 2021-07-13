
FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1


COPY ./requierements.txt /requierements.txt
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf & apk add --update --no-cache postgresql-client
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf & apk add --update --no-cache --virtual .tmp-build-deps  \
    gcc libc-dev linux-headers postgresql-dev

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf & pip install -r /requierements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user


#  & sudo python -m pip install --upgrade pip