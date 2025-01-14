from node:lts-alpine
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.19/main' >> /etc/apk/repositories
RUN apk add -u --no-cache blender-headless==4.0.1-r2 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.19/main
