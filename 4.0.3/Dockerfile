FROM swift:4.0.3

ENV VERSION 1.0
ENV DOCKER_USER="swifter"
ENV USR_LOCAL=/usr/local
ENV ENV_APP=$USR_LOCAL/app

ENV GOSU_VERSION 1.9
RUN set -x \
    && apt-get update \
    && apt-get install -y software-properties-common python-software-properties \
    && apt-add-repository ppa:git-core/ppa -y \
    && apt-get update \
    && apt-get install -y git ca-certificates wget libfreetype6-dev fontconfig libcairo2-dev libsdl2-dev liblcms2-dev && rm -rf /var/lib/apt/lists/* \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apt-get purge -y --auto-remove ca-certificates wget

RUN useradd -u 1234 -d $ENV_APP $DOCKER_USER
RUN chmod 755 /usr/lib/swift -R

VOLUME $ENV_APP
COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]

