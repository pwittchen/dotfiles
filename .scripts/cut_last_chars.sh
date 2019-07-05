#!/usr/bin/env bash

numberOfCharsToCut=$1
numberOfCharsToCut=$[numberOfCharsToCut+1];
rev | cut -c $numberOfCharsToCut- | rev
