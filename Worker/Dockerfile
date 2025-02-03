FROM ubuntu:24.04
# Not installing suggested or recommended dependencies
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker.
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
# Cleaning up package lists
RUN apt-get update
# Install Blender and dependencies
RUN apt-get install -y blender
# Install curl, ca-certificates and unzip
RUN apt-get install -y curl ca-certificates unzip
# Download, install and permanently enable blender addons
# Determine blender addon folder location
ENV blender_plugin_location="/usr/share/blender/scripts/addons"
# Set temp folder location
ENV temp_addon_location="/tmp/blender_addons/"
# Download addons
# blendluxcore
RUN curl --create-dirs -O --output-dir "${temp_addon_location%/}" https://objects.githubusercontent.com/github-production-release-asset-2e65be/112486720/a7c1b45c-f055-44cd-b283-201b71c6bba2?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250203%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250203T134407Z&X-Amz-Expires=300&X-Amz-Signature=e1ab2b32c925a02ec36dc74da027662309325ed3b7f84cb3686fe1a089d9815d&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3DBlendLuxCore-v2.8alpha1-linux64.zip&response-content-type=application%2Foctet-stream #"https://github.com/LuxCoreRender/BlendLuxCore/releases/download/blendluxcore_v2.8alpha1/BlendLuxCore-v2.8alpha1-linux64.zip"
# Unzip addons to addon directory
# blendluxcore
RUN ls -l "${temp_addon_location%/}"
RUN unzip "${temp_addon_location%/}/BlendLuxCore-v2.8alpha1-linux64" -d "${blender_plugin_location%/}/BlendLuxCore-v2.8alpha1-linux64"
# Copy addons to addon directory
# blendluxcore
#RUN mv BlendLuxCore-v2.8alpha1-linux64.zip $blender_plugin_location
# Copy install python script
COPY install_addons.py ./
# Execute install python script
RUN blender -b -P install_addons.py
# Download and extract flamenco from the website
RUN curl -O "https://flamenco.blender.org/downloads/flamenco-3.6-linux-amd64.tar.gz"
RUN tar xzf flamenco-3.6-linux-amd64.tar.gz
# Make files executable
RUN chmod 777 flamenco-3.6-linux-amd64/flamenco-worker
RUN chmod 777 flamenco-3.6-linux-amd64/tools/ffmpeg-linux-amd64
# Move files to dedicated new folder
RUN mv /flamenco-3.6-linux-amd64 /flamenco
# Add /usr/bin/flamenco and /usr/bin/flamenco/tools to $PATH to make it globally available
RUN export PATH=/flamenco:/flamenco/tools:$PATH
# Make it Persistent using docker config
ENV PATH=/flamenco:/flamenco/tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# Delete downloaded archive
RUN rm flamenco-3.6-linux-amd64.tar.gz
# Copy entrypoint script to allow the worker arguments to be controlled using eniroment variables and make it executable
COPY entry.sh ./
RUN chmod +x entry.sh
# Run as non-root user to avoid potential security issues
# Create new non-root user
RUN useradd -ms /bin/bash apprunner
# Select non-root user as default
USER apprunner
# Start the flamenco worker
ENTRYPOINT ./entry.sh
# Debug stdout
#ENTRYPOINT ./entry.sh
