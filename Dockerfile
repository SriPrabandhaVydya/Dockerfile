# Use an official Node.js runtime as a parent image
FROM node:14

# Set environment variables
ENV NODE_ENV=production

# Set a working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle app source
COPY . .

# Replace with your Docker Hub username
ENV DOCKER_HUB_USERNAME=SriPrabandhaVydya

# Replace with your Docker Hub repository name
ENV DOCKER_HUB_REPO=my-node-app

# Replace with your Docker Hub image tag
ENV DOCKER_HUB_TAG=latest

# Expose the port
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
