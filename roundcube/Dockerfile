FROM busybox

RUN mkdir -p /web /rc/tmp /rc/logs && chmod -R 777 /rc

ADD https://github.com/roundcube/roundcubemail/releases/download/1.2.3/roundcubemail-1.2.3-complete.tar.gz /tmp
RUN ARCHIVE=/tmp/roundcubemail-1.2.3-complete.tar.gz && \
  tar -C /tmp -xzf $ARCHIVE && \
  rm /$ARCHIVE && \
  mv /tmp/roundcubemail-1.2.3/* /web/ && \
  chown -R 0:0 /web /rc && \
  rm -fr /web/installer

ADD config.inc.php /web/config/

VOLUME /rc
