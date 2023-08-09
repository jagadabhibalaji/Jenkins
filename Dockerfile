FROM python:3.8

RUN mkdir /app

ADD . /app

WORKDIR /app



CMD ["python", "sample_app.py"]
