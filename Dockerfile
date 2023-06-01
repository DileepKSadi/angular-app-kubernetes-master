# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y nodejs \
    && npm install -g react-tools
RUN npm install -g @angular/cli
#RUN npm run build

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html
