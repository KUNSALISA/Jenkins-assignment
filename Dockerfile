# FROM jenkins/jenkins:lts

# USER root

# RUN apt-get update && apt-get install -y docker.io

# RUN usermod -aG docker jenkins

# USER jenkins

FROM jenkins/jenkins:lts

USER root

# ติดตั้ง docker (ยังจำเป็นสำหรับ stage หลัง ๆ)
RUN apt-get update && apt-get install -y \
    docker.io \
    curl \
    gnupg

# ติดตั้ง Node.js 18.x และ npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# ติดตั้ง Firebase CLI
RUN npm install -g firebase-tools

# ให้ jenkins user ใช้ docker ได้
RUN usermod -aG docker jenkins

USER jenkins
