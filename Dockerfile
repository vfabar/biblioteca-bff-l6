# biblioteca-eventos: la imagen que levanta el compose.yml de biblioteca-plataforma.
FROM node:24-alpine
WORKDIR /app

# Primero solo las dependencias: mientras package-lock.json no cambie, Docker reusa esta capa.
COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

EXPOSE 3000
CMD ["node", "dist/main.js"]