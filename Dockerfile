FROM ruby:3.1.2-slim
ARG precompileassets

RUN apt-get update && apt-get install -y curl gnupg
# bullseye = debian 11
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN curl -q https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get -y update && \
      apt-get install --fix-missing --no-install-recommends -qq -y \
        build-essential \
        vim \
        wget gnupg \
        git-all \
        curl \
        ssh \
        postgresql-client-14 libpq5 libpq-dev -y && \
      wget -qO- https://deb.nodesource.com/setup_16.x  | bash - && \
      apt-get install -y nodejs && \
      wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt-get update && \
      apt-get install yarn && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler
#Install gems
RUN mkdir /gems
WORKDIR /gems
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

ARG INSTALL_PATH=/opt/dockerrailsdemo
ENV INSTALL_PATH $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY . .

# RUN chown 777 scripts/
RUN ["chmod", "+x", "scripts/potential_asset_precompile.sh"]
RUN ["chmod", "+x", "scripts/start_rails.sh"]
RUN ["chmod", "+x", "scripts/start_webpack_dev.sh"]
RUN ["chmod", "+x", "scripts/wait-for-it.sh"]

RUN scripts/potential_asset_precompile.sh $precompileassets

