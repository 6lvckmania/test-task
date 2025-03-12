FROM jenkins/jenkins:lts

USER root

# Install Docker
RUN apt-get update -qq \
    && apt-get install -qqy \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common

# Add Docker's official GPG key
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker's repository
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
RUN apt-get update -qq \
    && apt-get install -qqy \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-compose-plugin

# Add Jenkins user to the Docker group
RUN usermod -aG docker jenkins
RUN chmod 777 /var/run/docker.sock

USER jenkins