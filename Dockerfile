FROM node:18
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN apt-get update && apt-get install -y python3 build-essential && ln -s /usr/bin/python3 /usr/bin/python
EXPOSE 3000
CMD ["node", "src/index.js"]
