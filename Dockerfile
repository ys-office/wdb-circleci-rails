FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /wdb-circleci-rails
WORKDIR /wdb-circleci-rails
COPY Gemfile /wdb-circleci-rails/Gemfile
COPY Gemfile.lock /wdb-circleci-rails/Gemfile.lock
RUN bundle install
COPY . /wdb-circleci-rails
