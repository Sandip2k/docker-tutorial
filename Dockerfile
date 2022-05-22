FROM node:alpine as builder
WORKDIR '/app'
RUN chown -R node:node /app
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html