# FROM jenkins/jenkins:lts

# USER root

# RUN apt-get update && apt-get install -y docker.io

# RUN usermod -aG docker jenkins

# USER jenkins

FROM jenkins/jenkins:lts

USER root

# ติดตั้ง docker สำหรับ Jenkins
RUN apt-get update && \
    apt-get install -y docker.io curl gnupg && \
    usermod -aG docker jenkins

# ติดตั้ง Node.js และ npm (ใช้สำหรับ firebase-tools)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# ติดตั้ง Firebase CLI
RUN npm install -g firebase-tools

USER jenkins
