
FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1


COPY ./requierements.txt /requierements.txt
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf & pip install -r /requierements.txt
 
RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user


#  & sudo python -m pip install --upgrade pip