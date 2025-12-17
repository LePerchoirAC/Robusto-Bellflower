FROM oven/bun:latest

ARG CLIENT_ID
ARG DISCORD_TOKEN

ENV CLIENT_ID=$CLIENT_ID
ENV DISCORD_TOKEN=$DISCORD_TOKEN

COPY package.json ./
COPY clientconfig.json ./
COPY deploy-commands.js ./
COPY bun.lock ./
COPY src ./src

RUN bun install
RUN ls
RUN bun run ./deploy-commands.js

CMD ["bun", "run", "./src/index.js"] 
