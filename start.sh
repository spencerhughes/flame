#!/bin/sh
echo "Setting permissions...
PUID: ${PUID}
PGID: ${PGID}"
usermod -u ${PUID} node
groupmod -g ${PGID} node
chown -R node:node .
echo "Starting flame..."
su -l -p -c 'node server.js' node
