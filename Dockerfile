FROM python:3.7-alpine

# Maintainer is deprecated use label
LABEL maintainer="Joon"

# Recommended for python in docker
ENV PYTHONUNBUFFERED=1

# Copy from our dir to the docker img
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Create directory 
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

# Adduser for security 
RUN adduser -D user
USER user