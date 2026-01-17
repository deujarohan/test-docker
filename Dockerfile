###########################################
# BASE IMAGE
###########################################
# Getting base image
FROM node:20 AS builder

MAINTAINER Rohan Deuja <rrohandeuja@gmail.com>

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

# =========================
# Stage 2: Distroless runtime
# =========================
FROM gcr.io/distroless/nodejs22-debian12

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD ["server.js"]
