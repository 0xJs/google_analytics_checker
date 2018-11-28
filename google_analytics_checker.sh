#!/bin/bash

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
  echo "The code "${analyticscode}" is not in the domain: ${website}"
else
  echo "The code "${analyticscode}" was found in ${website}"
fi
