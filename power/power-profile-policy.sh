#!/usr/bin/env bash
set -euo pipefail

AC_ONLINE=$(cat /sys/class/power_supply/AC*/online 2>/dev/null | head -n1)

if [[ "$AC_ONLINE" == "1" ]]; then
    PROFILE="balanced"
else
    PROFILE="power-saver"
fi

/usr/bin/powerprofilesctl set "$PROFILE"
