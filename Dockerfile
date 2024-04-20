FROM ubuntu:20.04
MAINTAINER Backer_Kuo <backerkuo@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive 
#Basic
RUN apt-get update
#RUN apt-get install -y apt-utils
#RUN apt-get install -y openjdk-8-jdk
#Google - https://source.android.com/docs/setup/start/requirements?hl=zh-tw
RUN apt-get install -y git-core \
                       gnupg \
                       flex \
                       bison \
                       build-essential \
                       zip \
                       curl \
                       zlib1g-dev \
                       libc6-dev-i386 \
                       libncurses5 \
                       x11proto-core-dev \
                       libx11-dev \
                       lib32z1-dev \
                       libgl1-mesa-dev \
                       libxml2-utils \
                       xsltproc \
                       unzip \
                       fontconfig

# Install gosu package
RUN set -eux; \
    apt-get update; \
    apt-get install -y gosu; \
    rm -rf /var/lib/apt/lists/*; \
    # verify that the binary works
    gosu nobody true

# entrypoint is used to update uid
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["bash"]
