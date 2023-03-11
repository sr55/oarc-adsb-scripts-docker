#!/bin/bash
set -x

IPATH=/usr/local/share/oarc-adsb

systemctl disable --now oarc-adsb-mlat
systemctl disable --now oarc-adsb-mlat2 &>/dev/null
systemctl disable --now oarc-adsb-feed

if [[ -d /usr/local/share/tar1090/html-oarc-adsb ]]; then
    bash /usr/local/share/tar1090/uninstall.sh oarc-adsb
fi

rm -f /lib/systemd/system/oarc-adsb-mlat.service
rm -f /lib/systemd/system/oarc-adsb-mlat2.service
rm -f /lib/systemd/system/oarc-adsb-feed.service

cp -f "$IPATH/oarc-adsb-uuid" /tmp/oarc-adsb-uuid
rm -rf "$IPATH"
mkdir -p "$IPATH"
mv -f /tmp/oarc-adsb-uuid "$IPATH/oarc-fi-uuid"

set +x

echo -----
echo "OARC ADS-B feed scripts have been uninstalled!"
