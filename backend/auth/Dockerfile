#base image
FROM node:20.10.0-buster-slim

#working directory
WORKDIR /app

#copy dependecy file
COPY package.json .

#install dependecies
RUN npm install --only=production

#copy the rest
COPY . .

#exposed port
EXPOSE 3001

#start our container in production
CMD ["node", "index.js"]