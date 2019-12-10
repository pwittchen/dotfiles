#!/usr/bin/env bash

source ~/.config/scripts/aqi.conf

URL="https://airapi.airly.eu/v2/measurements/installation?installationId=$SENSOR_ID"
API_KEY_PREFIX="apikey: "
API_KEY_HEADER="$API_KEY_PREFIX$API_KEY"
TYPE="Accept: application/json"
RESPONSE=$(curl -X GET \
    --silent \
    --header "$TYPE" \
    --header "$API_KEY_HEADER" \
    "$URL")

AQI=$(echo $RESPONSE | jq .current.indexes | jq '.[0]'.value | cut -f1 -d"." | cut -f1 -d",")
ADVICE=$(echo $RESPONSE | jq .current.indexes | jq '.[0]'.advice | cut -d "\"" -f 2)
DESC=$(echo $RESPONSE | jq .current.indexes | jq '.[0]'.description | cut -d "\"" -f 2)

if [ "$AQI" == "" ] ; then
  echo " "
  exit
fi

case 1 in
  $(($AQI <= 50)))  EMOJI="🔹";;
  $(($AQI <= 75)))  EMOJI="🔺";;
  $(($AQI <= 100))) EMOJI="😷";;
  $(($AQI >= 101))) EMOJI="😱";;
esac

if [ "$AQI" == "null" ]; then
    echo "🚫"
else
    echo "$EMOJI $AQI"
fi

echo "---"

if [ "$AQI" == "null" ]; then
    echo "Airly API rate limit exceeded or sensor is off"
else
  for i in {0..5}
  do
    if [ $i -eq 3 ]; then
        tabs='\t\t'
    elif [ $i -lt 4 ]; then
        tabs='\t\t\t\t'
    elif [ $i -lt 5 ]; then
        tabs='\t\t'
    else
        tabs='\t'
    fi
    echo -e $(echo $RESPONSE | jq .current.values | jq ".[$i]".name | cut -d "\"" -f 2) \
            $tabs \
            $(echo $RESPONSE | jq .current.values | jq ".[$i]".value)
  done

  echo $DESC
  echo $ADVICE
fi
