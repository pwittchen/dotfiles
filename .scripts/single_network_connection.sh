#!/usr/bin/env bash

wifi=$(nmcli connection show --active | grep wifi | awk '{print $4}')
ethe=$(nmcli connection show --active | grep ethernet | awk '{print $4}')

if [ "$wifi" == "wlp58s0" ] && [ "$ethe" == "enp0s31f6" ] ; then
    # we're connected both to the wifi and ethernet home network,
    # so we can turn off wifi
    nmcli connection down vcu
fi
