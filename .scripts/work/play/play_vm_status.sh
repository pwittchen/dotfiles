#!/usr/bin/env bash
source $HOME/.config/scripts/personal.conf
status=$(VBoxManage showvminfo "OraclePlay12_1808" | grep State | awk '{print $2}' | head -n 1)
if [ $status = "powered" ]; then
  echo "powered off"
else
  echo $status
fi
