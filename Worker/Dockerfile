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
# Move files to dedicated new folder
RUN mkdir /flamenco
RUN mv flamenco-3.6-linux-amd64/ flamenco/
# Add /usr/bin/flamenco and /usr/bin/flamenco/tools to $PATH to make it globally available
RUN export PATH=/flamenco:/flamenco/tools:$PATH
# Make it Persistent using docker config
ENV PATH=/flamenco:/flamenco/tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# Delete downloaded archive
RUN rm flamenco-3.6-linux-amd64.tar.gz
# Copy entrypoint script to allow the worker arguments to be controlled using eniroment variables
Copy entry.sh ./
# Run as non-root user to avoid potential security issues
# Create new non-root user
#RUN useradd -ms /bin/bash apprunner
# Select non-root user as default
#USER apprunner
# Start the flamenco worker
#ENTRYPOINT flamenco-worker -manager $MANAGER_URL
# Debug stdinorker
#ENTRYPOINT flamenco-worker -h