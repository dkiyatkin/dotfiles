#!/usr/bin/env bash
ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'
