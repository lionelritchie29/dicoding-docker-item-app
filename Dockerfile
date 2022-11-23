#use node image from docker hub with tag 14-alpine
FROM node:14-alpine

# set working directory to /app directory
WORKDIR /app

# copy all files from source in current directory in host to working directory in container (/app)
COPY . .

# create environment variable to be used in container
ENV NODE_ENV=production DB_HOST=item-db

# install needed dependencies and build the application 
RUN npm install --production --unsafe-perm && npm run build

# export port 8080 in the container, because it is the same port that will be used when the application run
EXPOSE 8080

# run "npm start" command after the image is built
CMD ["npm", "start"]