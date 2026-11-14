#!/bin/sh
# Refresh module dependencies after installing the patched LJCA modules.
KVER='@KVER@'
if [ -d "lib/modules/$KVER" ] && [ -x /sbin/depmod ]; then
    /sbin/depmod -a "$KVER"
fi
