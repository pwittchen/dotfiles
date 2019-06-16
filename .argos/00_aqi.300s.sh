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
ADVICE=$(echo $RESPONSE | jq .current.indexes | jq '.[0]'.advice)

if [ "$AQI" == "null" ]; then
    echo "AQI ?"
else
    echo "AQI $AQI ($ADVICE)"
fi

echo "---"

if [ "$AQI" == "null" ]; then
    echo "API rate limit exceeded or sensor is off"
else
  echo "measurement details:"
  echo ""

  for i in {0..5}
  do
    if [ $i -lt 3 ]; then
        tabs='\t\t'
    else
        tabs='\t'
    fi
    echo -e $(echo $RESPONSE | jq .current.values | jq ".[$i]".name) \
            $tabs \
            $(echo $RESPONSE | jq .current.values | jq ".[$i]".value)
  done

  echo -e  $(echo "AQI" \
           '\t\t' \
           echo $RESPONSE | jq .current.indexes | jq '.[0]'.value)
  echo -e  $(echo "Description" \
           '\t\t' \
           echo $RESPONSE | jq .current.indexes | jq '.[0]'.description)
fi
