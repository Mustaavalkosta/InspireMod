#!/system/bin/sh
#
# Brand build.prop to Inspire 4G
/system/xbin/sed -i 's/Desire HD/Inspire 4G/g' /system/build.prop
/system/xbin/sed -i 's/ro.com.google.clientidbase=android-google/ro.com.google.clientidbase=android-att-us/g' /system/build.prop
/system/xbin/echo "ro.ril.att.feature=1" >> /system/build.prop
/system/xbin/echo "ro.com.google.clientidbase.am=android-att-us" >> /system/build.prop
