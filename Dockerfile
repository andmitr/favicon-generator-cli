FROM node:24-alpine3.23

LABEL org.opencontainers.image.source=https://github.com/andmitr/favicon-generator-cli

WORKDIR /opt/favgen

COPY package*.json ./

RUN if [ -f package-lock.json ]; then npm ci --omit=dev; else npm install --omit=dev; fi

COPY fn_generate_favicons ./

USER node

WORKDIR /app

ENTRYPOINT ["node", "/opt/favgen/fn_generate_favicons"]
