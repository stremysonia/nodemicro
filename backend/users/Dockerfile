FROM node:latest

WORKDIR /app

COPY package.json .

#RUN npm install --omit=dev for production to not install dev dependecies
RUN npm install

COPY . ./

EXPOSE 3001

CMD [ "npm", "run", "dev" ]