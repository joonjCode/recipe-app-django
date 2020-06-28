FROM python:3.7-alpine

# Maintainer is deprecated use label
LABEL maintainer="Joon"

# Recommended for python in docker
ENV PYTHONUNBUFFERED=1

# Copy from our dir to the docker img
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \ 
        gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# Create directory 
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

# Adduser for security 
RUN adduser -D user
USER user