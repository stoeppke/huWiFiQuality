#!/usr/bin/env bash

querry_meta () {
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

main

exit 1