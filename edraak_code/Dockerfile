# Based on Code.org CircleCI-dependencies Dockerfile in .circle directory
# Pushed to Docker Hub at wintercdo/code-dot-org:0.7
FROM ubuntu:18.04

USER root

# Disabling interactive front-end
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Setting timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Updateing package repositories
RUN apt-get update -y; apt-get upgrade -y

# Installing helpers and prerequisites
RUN apt-get install -y git mysql-server mysql-client libmysqlclient-dev libxslt1-dev libssl-dev \
    zlib1g-dev imagemagick libmagickcore-dev libmagickwand-dev openjdk-11-jre-headless libcairo2-dev libjpeg8-dev \
    libpango1.0-dev libgif-dev enscript libsqlite3-dev build-essential redis-server  \
    chromium-browser parallel libreadline-dev vim curl tzdata

# Installing nvm
ENV HOME /root
ENV NVM_DIR /root/.nvm
ENV RBENV_DIR /root/.rbenv
ENV NODE_VERSION 8.15.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

## Installing rbenv
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
ENV PATH $RBENV_DIR/bin:$PATH
ENV PATH $RBENV_DIR/shims:$PATH
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

# Installing Ruby
RUN rbenv install 2.5.0
RUN rbenv global 2.5.0
RUN rbenv rehash

# Installing yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -y && apt-get install -y yarn=1.16.0-1

# Configuring chromium-browser
ENV CHROME_BIN /usr/bin/chromium-browser

# Installing bundler
RUN gem install bundler -v 1.17.3
RUN rbenv rehash

# Creating apps root directory and copying bash files
RUN mkdir /apps
COPY ./edraak_code/provision_or_run2.sh /apps/provision_or_run2.sh
COPY ./edraak_code/provision.sh /apps/provision.sh
COPY ./edraak_code/run2.sh /apps/run2.sh
