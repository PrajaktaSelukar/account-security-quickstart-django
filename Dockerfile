FROM python:3.8

ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

COPY requirements.txt ./

COPY Makefile ./

RUN make install

COPY . .

RUN make serve-setup

EXPOSE 8000

CMD ["sh", "-c", ". /usr/src/app/venv/bin/activate && make serve"]
