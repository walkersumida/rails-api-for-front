FROM ruby:2.5.6

RUN gem install bundler -v 1.17.3

ENV APP_ROOT /app

WORKDIR $APP_ROOT
