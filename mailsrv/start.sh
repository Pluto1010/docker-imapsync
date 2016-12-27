#!/bin/bash
/usr/local/bin/start-mailserver.sh &

sleep 30
IMAPSYNC=/usr/bin/imapsync

while true; do
  while ! nc -q 1 mailbackup 143 </dev/null; do
    echo "Waiting for mail server to become ready. Retring in 5 seconds..."
    sleep 5
  done

  $IMAPSYNC \
    --dry \
    --folder INBOX \
    --host1 ${IMAPSYNC_HOST1} \
    --user1 ${IMAPSYNC_USER1} \
    --password1 "${IMAPSYNC_PASSWORD1}" \
    --authmech1 PLAIN --tls1 \
    --host2 mailbackup \
    --user2 ${IMAPSYNC_USER2} \
    --password2 "${IMAPSYNC_PASSWORD2}" \
    --authmech2 PLAIN --tls2

  sleep 5

  duplicity

  sleep ${IMAPSYNC_WAIT}
done
