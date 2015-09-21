FROM busybox

RUN mkdir /web /rc

ADD https://github.com/roundcube/roundcubemail/releases/download/1.2.3/roundcubemail-1.2.3-complete.tar.gz /tmp
RUN ARCHIVE=/tmp/roundcubemail-1.2.3-complete.tar.gz && \
  tar -C /tmp -xzf $ARCHIVE && \
  rm /$ARCHIVE && \
  mv /tmp/roundcubemail-1.2.3/* /web/ && \
  chown -R 0:0 /web /rc && \
  rm -fr /web/installer

ADD config.inc.php /web/config/
ADD launch.sh /launch.sh

VOLUME /rc
CMD [ "sh", "/launch.sh" ]
