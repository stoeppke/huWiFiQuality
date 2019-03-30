#!/usr/bin/env bash
echo "works only for Grimm-Zentrum - by now (because greetings from sometimes worst eduroam ever)" 

querry_meta () {
    selector_countOthersOnAp='[bgcolor="#ddddd0"] text{}'
    curr_ssid=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | \
        awk -F ": " 'match ($1, /.*BSSID/) {printf "%s", $2}')
    for floor in $(seq 1 6)
    do
        url="https://www.cms.hu-berlin.de/de/dl/netze/wlan/stats/details/Berlin-MitteSchollstr1Grimm-Zentrum"$floor"Obergeschoss.details.html"    
        curl -s $url | pup $selector_countOthersOnAp | grep --after-context 3 --before-context 1 -i $curr_ssid
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