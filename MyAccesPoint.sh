#!/usr/bin/env bash

querry_meta () {
    curr_ssid=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | \
        awk -F ": " 'match ($1, /.*BSSID/) {printf "%s", $2}')
    for floor in $(seq 1 6)
    do
        url="https://www.cms.hu-berlin.de/de/dl/netze/wlan/stats/details/Berlin-MitteSchollstr1Grimm-Zentrum"$floor"Obergeschoss.details.html"    
        echo $url
    done


}

main () {

    if [[ $(uname -s) == "Darwin" ]]; then
        querry_meta
    fi

}
if which pup; then
    main
else
    echo "eror: pup needs to be installed. See https://github.com/ericchiang/pup"
    exit 0
fi

exit 1