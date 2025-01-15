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
RUN mv flamenco-3.6-linux-amd64 /usr/bin/flamenco
# Add /usr/bin/flamenco and /usr/bin/flamenco/tools to $PATH to make it globally available
RUN export PATH=/usr/bin/flamenco:/usr/bin/flamenco/tools:$PATH
# Make it Persistent using docker config
ENV PATH=/usr/bin/flamenco:/usr/bin/flamenco/tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# Delete downloaded archive
RUN rm flamenco-3.6-linux-amd64.tar.gz
# Run as non-root user
# Create new non-root user
#RUN useradd -ms /bin/bash apprunner
# Select non-root user as default
#USER apprunner
# Start the flamenco worker
#ENTRYPOINT flamenco-worker -manager $MANAGER_URL
# Debug stdinorker
ENTRYPOINT flamenco-worker -h