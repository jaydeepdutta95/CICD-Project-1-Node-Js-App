
FROM node:10-alpine

WORKDIR /home/node/app

COPY package*.json ./

RUN npm i

COPY . ./

EXPOSE 8000

CMD [ "node", "app.js" ]