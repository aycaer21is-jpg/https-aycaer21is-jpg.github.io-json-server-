FROM node:18-alpine
WORKDIR /app

# copy package files first for improved build caching
COPY package.json package-lock.json* ./

# Use npm install so build doesn't require a package-lock.json
RUN npm install --production || npm install --production

COPY . .

EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "start"]
