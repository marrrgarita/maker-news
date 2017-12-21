# Our base image
#FROM ruby:2.4.1

# Install some dependencies
#RUN apt-get update -qq && apt-get install -y build-essential libpq-dev apt-transport-https

# Add Yarn repository
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install Yarn for webpacker asset compiling
#RUN apt-get update -qq && apt-get install -y yarn

# Install gems and copy code to the container
#RUN mkdir /maker-news
#WORKDIR /maker-news
#COPY Gemfile /maker-news/Gemfile
#COPY Gemfile.lock /maker-news/Gemfile.lock
#RUN bundle install
#COPY . /maker-news

# Migrate and compile assets
#RUN bundle exec rails db:migrate
#RUN bundle exec rails assets:clean
#RUN bundle exec rails assets:precompile

# Start the server
#EXPOSE 3000
#CMD bundle exec rails s -p 3000 -b '0.0.0.0'
