#!/bin/sh
set -eux

mkdir -m 0770 -p /rc/tmp /rc/logs
chown -R 82:82 /rc
