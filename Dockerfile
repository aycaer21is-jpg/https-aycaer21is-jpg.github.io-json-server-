FROM node:18-alpine
WORKDIR /app

# copy package files first for improved build caching
COPY package.json package-lock.json* ./
RUN npm ci --only=production || npm install --production

COPY . .

EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "start"]
