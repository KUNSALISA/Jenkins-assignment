# Build Stage
FROM node:20-alpine AS build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

# Serve Stage
FROM node:20-alpine

WORKDIR /app

# ติดตั้ง serve สำหรับ hosting static site
RUN npm install -g serve

# คัดลอกเฉพาะไฟล์ที่ build แล้ว
COPY --from=build /app/dist .

EXPOSE 8080
CMD ["serve", "-s", ".", "-l", "8080"]
