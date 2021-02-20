FROM python:3.8-alpine

ENV PYTHONBUFFERED=1

RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers

RUN mkdir /backend

WORKDIR /backend/

COPY . /backend/

RUN pip install -r /backend/requirements.txt

RUN pip install gunicorn 

RUN apk del .tmp

CMD gunicorn -b 0.0.0.0:5000 flaskApp:flaskApp 
