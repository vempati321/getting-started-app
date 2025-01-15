FROM ubuntu:24.04
# Not installing suggested or recommended dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker.
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
# Cleaning up package lists
RUN apt-get update
# Install Blender and dependencies
RUN apt-get install -y blender
# Install curl and ca-certificates
RUN apt-get install -y curl ca-certificates
# Download and extract flamenco from the website
RUN curl -O "https://flamenco.blender.org/downloads/flamenco-3.6-linux-amd64.tar.gz"
RUN tar xzf flamenco-3.6-linux-amd64.tar.gz
# Make files executable
RUN chmod 777 flamenco-3.6-linux-amd64/flamenco-worker
RUN chmod 777 flamenco-3.6-linux-amd64/tools/ffmpeg-linux-amd64
# Move files to program folder
RUN mv flamenco-3.6-linux-amd64 /usr/bin/flamenco-
# Create link in /usr/bin to make it globally available
RUN ln -s /usr/bin/flamenco/flamenco-worker /usr/bin/flamenco-worker
# Delete downloaded archive
RUN rm flamenco-3.6-linux-amd64.tar.gz
# Run as non-root user
# Create new non-root user
#RUN useradd -ms /bin/bash apprunner
# Select non-root user as default
#USER apprunner
# Start the flamenco worker
#ENTRYPOINT flamenco -manager $MANAGER_URL
# Debug stdin
ENTRYPOINT flamenco -h