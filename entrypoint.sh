#!/bin/bash

USER_ID=${DEV_UID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m build
export HOME=/home/build
export USER=build

exec gosu build "$@"
