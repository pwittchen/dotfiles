
#!/usr/bin/env bash

function showIpExt {
  curl -s http://ipecho.net/plain | rev | cut -c 1- | rev

}

function showWeatherIn() {
  curl -s http://wttr.in/"$1" | head -n 7 && printf "\n"
}
