FROM ruby:2.0.0

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile .
COPY Gemfile.lock .

RUN echo 'install: --no-ri --no-rdoc' >> .gemrc && \
    echo 'update: --no-ri --no-rdoc' >> .gemrc

RUN bundle install -j4

COPY . /myapp

CMD /bin/bash
