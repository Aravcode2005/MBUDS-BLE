FROM node:26-slim

WORKDIR /app

COPY --chown=node:node package.json package-lock.json ./
RUN  npm ci --omit-dev
COPY --chown=node:node . .
ENV NODE_ENV=production
RUN  chmod +x ./entrypoint.sh
USER node
EXPOSE 8083

ENTRYPOINT ["./entrypoint.sh"]