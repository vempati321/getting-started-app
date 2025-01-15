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
RUN blender_plugin_location = "/usr/share/blender/scripts/addons"
# Set temp folder location
RUN temp_addon_location = "/tmp/blender_addons/"
# Download addons
# blendluxcore
RUN crul --create-dirs -O --output-dir $temp_addon_location "https://github.com/LuxCoreRender/BlendLuxCore/releases/download/blendluxcore_v2.8alpha1/BlendLuxCore-v2.8alpha1-linux64.zip"
# Unzip addons to addon directory
# blendluxcore
RUN unzip "${temp_addon_location%/}/BlendLuxCore-v2.8alpha1-linux64.zip" -d "${blender_plugin_location%/}/BlendLuxCore-v2.8alpha1-linux64"
# Copy addons to addon directory
# blendluxcore
#RUN mv BlendLuxCore-v2.8alpha1-linux64.zip $blender_plugin_location
# Copy install python script
Copy install_addons.py ./
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
Copy entry.sh ./
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