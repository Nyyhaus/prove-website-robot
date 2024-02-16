FROM ubuntu:latest

RUN mkdir -p /opt/robotframework

WORKDIR /opt/robotframework

RUN apt-get update && apt-get upgrade -y && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt install python3.10 python3-pip wget -y

# RUN apt install libxkbcommon0 libxrandr2 xdg-utils fonts-liberation -y

# Install Python dependencies
RUN pip install pip==23.2.1 \
                robotframework \
                rpaframework==28.2.0 \
                robocorp-truststore==0.8.0

# Install Chrome (adjust based on your platform)
# Debian/Ubuntu
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install ./google-chrome-stable_current_amd64.deb -y

# Other platforms (CentOS, Fedora, etc.) might require different package names and installation methods.

# Set environment variables (optional)
ENV CHROME_DRIVER=/usr/local/bin/chromedriver

# Copy your Robocorp code
# COPY . .

RUN python3 --version

# Run your Robot Framework tests
CMD ["robot", "--suite", "tasks.robot"]















# FROM fedora:39

# ENV CHROMIUM_VERSION 121.0

# COPY requirements.txt /.

# # Install chrome
# RUN dnf upgrade -y --refresh && dnf install fedora-workstation-repositories 'dnf-command(config-manager)' -y
# RUN dnf config-manager --set-enabled google-chrome

# # Install system dependencies
# RUN dnf install -y \
#     google-chrome-stable \ 
#     python3-pip \
#     && dnf clean all

# RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 --family 1
# RUN 1 | update-alternatives --config python

# # Should be 3.10.12
# RUN python3 --version

# # Install Robot Framework and associated libraries
# # RUN pip install --no-cache-dir -r requirements.txt
