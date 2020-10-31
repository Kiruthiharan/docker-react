# as tags it as builder phase
FROM node:10-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# /app/build contains all info we need
# no as means its run only can have one without as
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html



