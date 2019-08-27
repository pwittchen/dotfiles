#!/usr/bin/env bash
echo "stopping virtual machine"
VBoxManage controlvm "OraclePlay12_1808" poweroff --type headless
echo "done"
