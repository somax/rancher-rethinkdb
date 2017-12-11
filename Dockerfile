FROM rethinkdb:2.3.6
MAINTAINER xkodiak,somax

COPY assets/sources.list /etc/apt/

RUN apt update && apt install -y curl \
    && rm -rf /var/lib/apt/lists/*

COPY assets/*.sh /

RUN chmod +x /db.sh \
    && chmod +x /proxy.sh 

ENTRYPOINT [ "/db.sh" ]