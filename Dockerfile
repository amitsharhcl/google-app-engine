FROM python:3.6-slim-stretch

RUN apt update

RUN apt install -y python3-dev gcc

ADD requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY app app/

EXPOSE 8080

CMD ["gunicorn", "-b", ":8080", "--chdir", "app/", "main:app"]
