FROM ruby:2.0

RUN apt-get update && apt-get install -y \
	mysql-client \
	nodejs \
	#postgresql-client \
	#sqlite3 \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /gems

WORKDIR /gems
ADD Gemfile /gems/Gemfile
ADD Gemfile.lock /gems/Gemfile.lock
RUN bundle config --global frozen 1

RUN bundle install

WORKDIR /app
ADD . /app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]