from node:lts-alpine
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.19/main' >> /etc/apk/repositories
RUN apk add --no-cache blender-headless==4.0.1-r2 --repository=https://dl-cdn.alpinelinux.org/alpine/v3.19/community --repository=https://dl-cdn.alpinelinux.org/alpine/v3.19/main
