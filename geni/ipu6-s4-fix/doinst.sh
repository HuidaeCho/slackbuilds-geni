#!/bin/sh
config() {
  NEW="$1"
  OLD="`dirname $NEW`/`basename $NEW .new`"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}
config etc/elogind/system-sleep/ipu6.conf.new

# Refresh module dependencies after installing the patched LJCA modules.
KVER='@KVER@'
if [ -d "lib/modules/$KVER" ] && [ -x /sbin/depmod ]; then
  /sbin/depmod -a "$KVER"
fi
