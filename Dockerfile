FROM node:9.7.1 as dev

RUN apt-get update && apt-cache madison libxml2-utils && apt-get -y install \
	inotify-tools=3.14-1+b1 \
	rsync=3.1.1-3+deb8u1 \
	libxml2-utils=2.9.1+dfsg1-5+deb8u6

WORKDIR /usr/src/app

COPY resources ./resources

# RUN ./resources/watch_events.bash &

# CMD bash
CMD ["./resources/watch_events.bash"]