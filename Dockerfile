# Stage 1: Build the application
FROM node:18-alpine as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create the final image
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/package.json /app/package-lock.json ./
RUN npm install --production
COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
CMD ["npm", "start"]
