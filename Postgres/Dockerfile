FROM postgres:latest

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENV TZ 'Europe/Moscow'

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]
