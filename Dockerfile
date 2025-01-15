from ubuntu:24.04
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker.
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3
RUN apt-get update
RUN apt-get install -y blender
RUN useradd -ms /bin/bash apprunner
USER apprunner