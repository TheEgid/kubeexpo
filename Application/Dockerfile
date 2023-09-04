FROM node:20-bookworm-slim

RUN apt-get update && apt-get install -y curl

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install pnpm -g

RUN pnpm install --frozen-lockfile

COPY ./ ./

EXPOSE 8080

ENV NODE_ENV production

ENV NEXT_TELEMETRY_DISABLED 1

RUN pnpm build

CMD ["pnpm", "start"]
