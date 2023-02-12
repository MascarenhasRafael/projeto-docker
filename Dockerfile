FROM ruby:3.2.0-alpine3.17

WORKDIR /app

RUN apk add --update --no-cache \
  binutils-gold \
  build-base \
  curl \
  file \
  g++ \
  gcc \
  git \
  less \
  libstdc++ \
  libffi-dev \
  libc-dev \ 
  linux-headers \
  libxml2-dev \
  libxslt-dev \
  libgcrypt-dev \
  make \
  netcat-openbsd \
  nodejs \
  openssl \
  pkgconfig \
  postgresql-dev \
  python3 \
  tzdata \
  yarn 

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN yarn install
COPY . ./ 

ENTRYPOINT ["rails", "s", "--environment=PRODUCTION"]