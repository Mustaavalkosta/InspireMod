#!/sbin/sh
#
# /system/addon.d/60-inspiremod.sh
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/CodecDSPID.txt
etc/init.d/30dualmic
etc/soundimage/Sound_Bass_Booster_MCLK.txt
etc/soundimage/Sound_Blues_MCLK.txt
etc/soundimage/Sound_Classical_MCLK.txt
etc/soundimage/Sound_Country_MCLK.txt
etc/soundimage/Sound_Dolby_A_HP_MCLK.txt
etc/soundimage/Sound_Dolby_A_SPK_MCLK.txt
etc/soundimage/Sound_Dolby_HP_MCLK.txt
etc/soundimage/Sound_Dolby_Spk_MCLK.txt
etc/soundimage/Sound_Dolby_V_HP_MCLK.txt
etc/soundimage/Sound_Dolby_V_SPK_MCLK.txt
etc/soundimage/Sound_Dualmic_EP_MCLK.txt
etc/soundimage/Sound_Dualmic_MCLK.txt
etc/soundimage/Sound_Dualmic_SPK_MCLK.txt
etc/soundimage/Sound_Jazz_MCLK.txt
etc/soundimage/Sound_Latin_MCLK.txt
etc/soundimage/Sound_New_Age_MCLK.txt
etc/soundimage/Sound_Original_MCLK.txt
etc/soundimage/Sound_Piano_MCLK.txt
etc/soundimage/Sound_Pop_MCLK.txt
etc/soundimage/Sound_R_B_MCLK.txt
etc/soundimage/Sound_Rock_MCLK.txt
etc/soundimage/Sound_SRS_A_HP_MCLK.txt
etc/soundimage/Sound_SRS_A_SPK_MCLK.txt
etc/soundimage/Sound_SRS_V_HP_MCLK.txt
etc/soundimage/Sound_SRS_V_SPK_MCLK.txt
etc/soundimage/Sound_Treble_Booster_MCLK.txt
etc/soundimage/Sound_Vocal_Booster_MCLK.txt
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    rm -rf /system/etc/soundimage
    rm -f /system/etc/CodecDSPID.txt
    rm -f /system/etc/init.d/30dualmic
  ;;
  post-restore)
    # Stub
  ;;
esac
