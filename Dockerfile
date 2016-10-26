FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /weatherical
WORKDIR /weatherical
ADD Gemfile /weatherical/Gemfile
ADD Gemfile.lock /weatherical/Gemfile.lock
RUN bundle install
ADD . /weatherical
