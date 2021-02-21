FROM alpine:latest


RUN apk add --no-cache python3-dev && pip3 install --upgrade pip

RUN mkdir /app

WORKDIR /app/

COPY . /app/

RUN pip3 install -r requirements.txt

RUN pip3 install gunicorn 

EXPOSE ${PORT} 

CMD gunicorn -b 0.0.0.0:${PORT} flaskApp:app