# Using Ubuntu instead of Fedora, because it is easier 
# to change to different version of python
# use of the libraries in the tests requires python 3.10
FROM ubuntu:latest

# copy robot files to container
COPY . /tests

# Set python 3.10
RUN apt-get update && apt-get upgrade -y && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt install python3.10 python3-pip wget -y

# Install Python dependencies
RUN pip install --no-cache-dir -r tests/requirements.txt

# Install Chrome (adjust based on your platform)
# Debian/Ubuntu
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install ./google-chrome-stable_current_amd64.deb -y