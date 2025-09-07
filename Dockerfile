# This Dockerfile is used for personal purposes only

FROM ruby:2.6.5-alpine3.11

# Install system packages
#
# Alpine available Node version: 12.22
# Check Alpine available Node version here:
# https://pkgs.alpinelinux.org/packages?name=nodejs&branch=v3.11
#
RUN apk add --no-cache \
    build-base \
    busybox \
    ca-certificates \
    gnupg1 \
    graphicsmagick \
    libsodium-dev \
    postgresql-dev \
    rsync \
    git \
    tzdata \
    nodejs~=12.22.6 \
    npm \
    bash \
    shared-mime-info
RUN npm install --global yarn@1.22.4
RUN gem install bundler -v 2.2.3

ENV BUNDLER_VERSION 2.2.3

WORKDIR /backend

COPY . /rails_terraform_docker
WORKDIR /rails_terraform_docker

ARG build_without
ARG rails_env

RUN npm install
RUN bundle install
RUN rm -rf /root/.ssh/id_rsa \
    /usr/local/bundle/bundler/gems/*/.git \
    /usr/local/bundle/cache/

RUN RAILS_ENV=production NODE_ENV=production SECRET_KEY_BASE=not_set OLD_AWS_SECRET_ACCESS_KEY=not_set OLD_AWS_ACCESS_KEY_ID=not_set bundle exec rake assets:precompile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]