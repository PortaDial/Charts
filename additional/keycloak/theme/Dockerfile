FROM node:10 as node

WORKDIR /usr/src/app

COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn build:prod

FROM busybox
COPY --from=node /usr/src/app/carbon /portadial
