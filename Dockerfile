# rebased/repackaged base image that only updates existing packages
FROM mbentley/debian:buster
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

RUN apt-get update &&\
  apt-get install -y libgbm1 libx11-xcb1 procps pulseaudio wget &&\
  wget "https://discordapp.com/api/download?platform=linux&format=deb" -O /tmp/discord.deb &&\
  dpkg -i /tmp/discord.deb || apt-get install -fy  &&\
  rm /tmp/discord.deb &&\
  apt-get purge -y wget &&\
  rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/discord","--no-sandbox"]
