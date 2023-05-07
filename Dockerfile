# Dockerfile

FROM ruby:2.7.6

WORKDIR /.
COPY . /.
RUN bundle install

EXPOSE 4567

CMD ["ruby", "app.rb"]
