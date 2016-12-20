#!/bin/bash
IMAPSYNC=/usr/bin/imapsync

while ! nc -q 1 mail 143 </dev/null; do
  echo "Waiting for mail server to become ready. Retring in 5 seconds..."
  sleep 5
done

while true; do
  $IMAPSYNC \
    --host1 ${IMAPSYNC_HOST1} \
    --user1 ${IMAPSYNC_USER1} \
    --password1 "${IMAPSYNC_PASSWORD1}" \
    --authmech1 PLAIN --tls1 \
    --host2 mail \
    --user2 ${IMAPSYNC_USER2} \
    --password2 "${IMAPSYNC_PASSWORD2}" \
    --authmech2 PLAIN --tls2
  sleep ${IMAPSYNC_WAIT}
done
