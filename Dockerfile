FROM python:3.8

WORKDIR /home

ENV AIRFLOW_HOME /home

COPY requirements.txt /home

RUN pip install -r requirements.txt
