FROM node:24-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Optional build-time argument for stats tracking endpoint
ARG PUBLIC_STATS_ENDPOINT
ENV PUBLIC_STATS_ENDPOINT=$PUBLIC_STATS_ENDPOINT

# Optional build-time argument for Meta Pixel ID
ARG PUBLIC_FACEBOOK_PIXEL_ID
ENV PUBLIC_FACEBOOK_PIXEL_ID=$PUBLIC_FACEBOOK_PIXEL_ID

RUN npm run build

FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile

COPY --from=builder /app/dist /usr/share/caddy

EXPOSE 80