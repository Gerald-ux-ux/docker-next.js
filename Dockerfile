FROM node:18-alpine as build
WORKDIR /app
#Copy everything to the container except Docker
COPY . .
RUN npm install 
RUN npm run build
CMD [ "npm", "start" ]
