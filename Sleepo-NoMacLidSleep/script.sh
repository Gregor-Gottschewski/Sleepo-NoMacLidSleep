#!/bin/bash
# Displays the current setting for pmset displaysleep

CURRENT_SLEEP_MODE=$(pmset -g | grep SleepDisabled)
SLEEP_DISABLED=${CURRENT_SLEEP_MODE: -1}
echo $SLEEP_DISABLED
