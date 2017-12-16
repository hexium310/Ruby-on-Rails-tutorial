FROM ruby

ENV APP_ROOT /usr/src/RoR-tutorial
WORKDIR $APP_ROOT

RUN apt-get update && \
    apt-get install -y sqlite3 nodejs

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc && \
    bundle install
