#
# AMP Dockerfile
#
# https://github.com/othrayte/docker-cc-amp
#

# Pull base image.
FROM debian

# Install dependencies
RUN apt-get update && apt-get install -y \
  lib32gcc1 \
  coreutils \
  screen \
  socat \
  unzip \
  git \
  wget \
  openjdk-7-jre \
&& rm -rf /var/lib/apt/lists/*

RUN groupadd -r AMP && useradd -r -g AMP -d /home/AMP AMP

USER AMP

RUN \
  mkdir ~/AMP \
  cd ~/AMP \
  wget http://cubecoders.com/Downloads/ampinstmgr.zip \
  unzip ampinstmgr.zip \
  rm -i ampinstmgr.zip \

# Define working directory.
WORKDIR /home/AMP/AMP

# Define default command.
CMD ["start_ads.sh"]

# Expose ports.
EXPOSE 8080
