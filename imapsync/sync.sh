#!/bin/bash
IMAPSYNC=/usr/bin/imapsync
exit

sleep 30

while true; do
  $IMAPSYNC \
    --host1 imap.1und1.de \
    --user1 dennis@port42.org \
    --password1 'TzTGMkMmVtMREza8mO!hK' \
    --authmech1 PLAIN --tls1 \
    --host2 mail \
    --user2 dennis@port42.org \
    --password2 'test1234' \
    --authmech2 PLAIN --tls2
  sleep 3600
done
