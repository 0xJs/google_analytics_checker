#!/bin/bash

#Author: Kadeeli
#Small script that will check if the webpage contains the string "'anonymizeIP', true" to check
#if the webpage has the anonymize ip option for google analytics turned on.

website=$1

if [[ $# -eq 0 ]] ; then
  echo "Please provide an webadres or IP"
  echo "For example: ./"$(basename "$0")" www.hackdefense.nl"
  exit 0
fi

#wget -O to specify file to output, "-" outputs onto standard output. -q option for quiet
curlwebsite="$(wget $website -q -O - | grep anonymizeIp)"
analyticscode="'anonymizeIp', true"

if [ "${curlwebsite/$analyticscode}" = "$curlwebsite" ] ; then
  echo "The code "${analyticscode}" does not exist in the domain: ${website}"
else
  echo "The code "${analyticscode}" was found in ${website}"
fi
