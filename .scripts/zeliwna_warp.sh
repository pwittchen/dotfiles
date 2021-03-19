#!/usr/bin/env bash
kubectl warp -i -t --image 801254768788.dkr.ecr.us-east-1.amazonaws.com/warp:master pw-warp -- /bin/bash
