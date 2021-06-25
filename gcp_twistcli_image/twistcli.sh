#!/bin/sh
TL_PASS=`gcloud secrets versions access 1 --secret="$TL_SECRET_NAME" --format='get(payload.data)' | tr '_-' '/+' | base64 -d`
curl -k -u $TL_USER:$TL_PASS --output twistcli $TL_CONSOLE_URL/api/v1/util/twistcli
chmod a+x twistcli
./twistcli images scan --details  --address $TL_CONSOLE_URL --user $TL_USER --password $TL_PASS $1
