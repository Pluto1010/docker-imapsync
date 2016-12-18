FROM busybox

# ADD https://github.com/RainLoop/rainloop-webmail/archive/v1.10.5.192.zip /rainloop/
ADD https://www.rainloop.net/repository/webmail/rainloop-community-latest.zip /rainloop/
RUN cd /rainloop/ && ZIPFILE=`ls -1 /rainloop/*.zip` && unzip -d /rainloop $ZIPFILE && rm $ZIPFILE
