#!/bin/sh
# Refresh module dependencies after removal restores the stock LJCA modules.
KVER='@KVER@'
if [ -d "lib/modules/$KVER" ] && [ -x /sbin/depmod ]; then
    /sbin/depmod -a "$KVER"
fi
