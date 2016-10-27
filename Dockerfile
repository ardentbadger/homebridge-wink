FROM ubuntu:14.04.5
RUN mkdir -p /homebridge && \
  mkdir -p /var/run/dbus && \
	mkdir -p ~/.homebridge
WORKDIR /homebridge/
RUN apt-get update && \
  apt-get install -y curl git build-essential python libavahi-compat-libdnssd-dev
RUN curl -L https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs
RUN npm install --unsafe-perm -g homebridge homebridge-wink
COPY config.json /root/.homebridge
EXPOSE 5353 51826
COPY run.sh /homebridge/run.sh
RUN chmod a=x /homebridge/run.sh
CMD ["/homebridge/run.sh"]
