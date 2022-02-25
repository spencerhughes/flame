FROM node:16 as builder

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .

RUN mkdir -p ./public ./data \
    && cd ./client \
    && npm install --production \
    && npm run build \
    && cd .. \
    && mv ./client/build/* ./public \
    && rm -rf ./client

FROM node:16-alpine

COPY --from=builder /app /app

WORKDIR /app

RUN apk add --no-cache shadow

EXPOSE 5005

ENV NODE_ENV=production
ENV PASSWORD=flame_password
ENV PUID=1000
ENV PGID=1000

CMD ["/app/start.sh"]