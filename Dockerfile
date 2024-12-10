FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
EXPOSE 3007
CMD ["node","src/index.js"]
