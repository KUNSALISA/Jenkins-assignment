# FROM jenkins/jenkins:lts

# USER root

# RUN apt-get update && apt-get install -y docker.io

# RUN usermod -aG docker jenkins

# USER jenkins

# Build stage
FROM node:20-alpine AS build

WORKDIR /app

COPY frontend/package*.json ./frontend/
RUN cd frontend && npm ci

COPY frontend ./frontend
RUN cd frontend && npm run build

# Serve stage
FROM node:20-alpine

WORKDIR /app

RUN npm install -g serve

COPY --from=build /app/frontend/dist ./

EXPOSE 8080
CMD ["serve", "-s", ".", "-l", "8080"]
