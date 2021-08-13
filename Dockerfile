# Compile and Build Angular Codebase

# Base Image
FROM node:12.18.1 as build

# Set the Working directory
WORKDIR /usr/local/app

# Copying Files to Working Dir
COPY ./ /usr/local/app/

# Installing Dependencies
RUN npm install

# Generating Production Build
RUN npm run build


# Serving App with Nginx Server

# Base Image
FROM nginx:latest

# Copy the build output to replace the default nginx contents
COPY --from=build /usr/local/app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80
