FROM node:12.7-alpine AS build
WORKDIR /usr/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 4200
CMD ["npm", "run", "build"]

FROM nginx:1.17.1-alpine
COPY --from=build /usr/app/dist/docker-angular-multi-stage /usr/share/nginx/html
