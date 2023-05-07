FROM ruby:2.7.6
RUN apt update && apt install pandoc -y
WORKDIR /.
COPY . /.
RUN bundle install

EXPOSE 4567

CMD ["ruby", "app.rb"]
