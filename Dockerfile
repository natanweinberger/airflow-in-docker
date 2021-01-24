FROM python:3.8

WORKDIR /home

COPY requirements.txt /home

RUN pip install -r requirements.txt
