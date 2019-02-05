FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN npm i -D terser@3.14
COPY . .
RUN npm run build
#CMD ["npm", "run", "start"]

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html