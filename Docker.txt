# Getting base image ubuntu
FROM ubuntu

MAINTAINER Rohan Deuja <rrohandeuja@gmail.com>

# everything is done inside /app folder
WORKDIR /app

# Install Node.js once during build
RUN apt-get update && apt-get install -y nodejs npm

COPY package*.json ./

# Install all dependencies listed in package.json
RUN npm install

# Copy all files from your repo into /app
COPY . .

# Expose the port your app will run on
EXPOSE 3000

# CMD just starts your app
CMD ["node", "server.js"]