# Using Ubuntu instead of Fedora, because it is easier 
# to change to different version of python
# use of the libraries in the tests requires python 3.10
# FROM ubuntu:latest
FROM python:3.10-slim-buster

# copy robot files to container
COPY tests /tests
WORKDIR tests

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Update, install wget and firefox-esr, because regular firefox cannot be installed straightforward
RUN apt update && apt upgrade -y && apt install wget firefox-esr -y

# Install Chrome (adjust based on your platform)
# Debian/Ubuntu
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install ./google-chrome-stable_current_amd64.deb -y

RUN apt remove wget python3-pip -y
RUN rm google-chrome-stable_current_amd64.deb