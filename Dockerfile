FROM ruby:3.0.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN bundle install

ARG DATABASE_HOST
ENV DATABASE_HOST $DATABASE_HOST

COPY . .

EXPOSE 3000:3000

CMD ["rails", "server", "-b", "0.0.0.0"]
