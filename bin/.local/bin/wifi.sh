wifi_info=$(wicd-cli --wireless -d)

if [ $? != 0 ]; then
    signal=0
    essid=""
else
    signal=$(echo "$wifi_info" | grep Quality | awk -F ': ' '{print $2}')
    essid=$(echo "$wifi_info" | grep Essid | awk -F ': ' '{print $2}')
fi

WIFI_NETWORK_NAME=$essid
WIFI_SIGNAL_STRENGTH=$signal
