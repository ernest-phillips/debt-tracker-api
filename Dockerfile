FROM ruby:3.1.2-alpine
WORKDIR /usr/src/app

RUN apk add --no-cache --update \
  build-base \
  libpq-dev \
  libc6-compat \
  tzdata \
  less

COPY Gemfile* /usr/src/app/
RUN bundle update --bundler && bundle install
COPY . .

EXPOSE 3000

CMD ["puma"]
