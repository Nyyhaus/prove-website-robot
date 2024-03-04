# use of the libraries in the tasks requires python 3.10
FROM python:3.10-slim-buster

# copy robot files to container
COPY . test-prove-website

# Update system, install wget and firefox-esr, because regular firefox cannot be installed straightforward
RUN apt update && apt upgrade -y && apt install wget firefox-esr -y

# Install Python dependencies
RUN pip install --no-cache-dir -r test-prove-website/tasks/requirements.txt

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install ./google-chrome-stable_current_amd64.deb -y

# set working directory
WORKDIR /test-prove-website