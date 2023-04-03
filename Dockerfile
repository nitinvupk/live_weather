FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /usr/src/live_weather
WORKDIR /usr/src/live_weather
ADD Gemfile /usr/src/live_weather/Gemfile
ADD Gemfile.lock /usr/src/live_weather/Gemfile.lock
RUN bundle install
ADD . /usr/src/live_weather
