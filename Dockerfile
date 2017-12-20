FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /maker-news
WORKDIR /maker-news
COPY Gemfile /maker-news/Gemfile
COPY Gemfile.lock /maker-news/Gemfile.lock
RUN bundle install
COPY . /maker-news
EXPOSE 3000
CMD bundle exec rails s -p 3000 -b '0.0.0.0'
