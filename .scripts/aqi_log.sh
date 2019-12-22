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
DESC=$(echo $RESPONSE | jq .current.indexes | jq '.[0]'.description | cut -d "\"" -f 2)

if [ "$AQI" != "" ] ; then
  case 1 in
    $(($AQI <= 50)))  EMOJI="✔";;
    $(($AQI <= 75)))  EMOJI="🏭";;
    $(($AQI <= 100))) EMOJI="😷";;
    $(($AQI >= 101))) EMOJI="😱";;
  esac

  if [ "$AQI" != "null" ]; then
    echo "$EMOJI $AQI" > /var/log/scripts/aqi.log
  fi
fi
