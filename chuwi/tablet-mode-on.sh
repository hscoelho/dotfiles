#!/usr/bin/env bash

sudo evemu-event /dev/input/tablet-switch \
  --type EV_SW --code SW_TABLET_MODE --value 1

sudo evemu-event /dev/input/tablet-switch \
  --type EV_SYN --code SYN_REPORT --value 0
