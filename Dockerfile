FROM node:lts-alpine
WORKDIR /app
RUN npm install -g @mintlify/cli@latest
COPY package*.json ./
RUN if [ -f package.json ]; then npm install; fi
EXPOSE 3000
CMD ["mint", "dev", "--host", "0.0.0.0"]
