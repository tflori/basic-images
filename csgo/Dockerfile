FROM ubuntu:18.04

ENV USER csgo
ENV HOME /home/$USER
ENV SERVER $HOME/hlserver

VOLUME $SERVER/csgo

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install lib32gcc1 curl net-tools lib32stdc++6 locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd $USER \
    && chown -R $USER:$USER $HOME \
    && cp /bin/bash /bin/sh

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

USER $USER
RUN curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvz \
    && cd $SERVER \
    && ./steamcmd.sh "+login anonymous" "+quit" \
    && ln -s $SERVER/linux32 $HOME/.steam/sdk32

ADD ./csgo.sh /usr/bin/csgo

EXPOSE 27015/udp
EXPOSE 27015

WORKDIR /home/csgo/hlserver
ENTRYPOINT ["/usr/bin/csgo"]
CMD ["-console" "-usercon" "+game_type" "0" "+game_mode" "1" "+mapgroup" "mg_active" "+map" "de_cache"]
