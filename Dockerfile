FROM ruby:2.5.3-slim

EXPOSE 80

COPY stupid_server.rb /app/

WORKDIR /app

CMD ["ruby", "stupid_server.rb"]

