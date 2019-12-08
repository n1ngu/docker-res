FROM debian

ARG UID=2222
ARG GID=2222

RUN apt-get update \
    && apt-get install \
        --assume-yes \
        netcat

RUN groupadd res \
        --gid $GID \
    && useradd res \
        --uid $UID \
        --gid $GID \
        --home-dir /var/lib/res \
        --create-home

USER res
VOLUME /var/lib/res
WORKDIR /var/lib/res
EXPOSE 1234
CMD while true; do echo "res" | netcat -l -p 1234; done
