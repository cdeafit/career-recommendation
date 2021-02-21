FROM alpine:latest

# ENV PYTHONBUFFERED=1

# RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers

RUN apk add --no-cache python3-dev && pip3 install --upgrade pip

# RUN mkdir /app

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt

RUN pip3 install gunicorn 

# RUN apk del .tmp

CMD gunicorn -b 0.0.0.0:$PORT flaskApp:app