# FROM jenkins/jenkins:lts

# USER root

# RUN apt-get update && apt-get install -y docker.io

# RUN usermod -aG docker jenkins

# USER jenkins

FROM jenkins/jenkins:lts

USER root

# ติดตั้ง Docker CLI (ไว้ใช้ docker build, compose)
RUN apt-get update && apt-get install -y \
  docker.io \
  curl \
  gnupg \
  ca-certificates \
  sudo

# ติดตั้ง Node.js + npm (ใช้ Node.js v18)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# ติดตั้ง Firebase CLI แบบ global
RUN npm install -g firebase-tools

# ให้ user jenkins ใช้ docker ได้
RUN usermod -aG docker jenkins

USER jenkins
