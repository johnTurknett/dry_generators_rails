FROM ruby

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
Run echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs \
                                             yarn \
                                             libavahi-compat-libdnssd-dev

COPY . .

WORKDIR /user/src/app/test/dummy
RUN bundle install

WORKDIR /usr/src/app
RUN bundle install
