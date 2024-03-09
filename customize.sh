#!/system/bin/sh

# shellcheck disable=SC2034
# shellcheck disable=SC1090
# shellcheck disable=SC2154
# shellcheck disable=SC2068
# shellcheck disable=SC2016
# shellcheck disable=SC2001

SKIPUNZIP=1


REMOVE_SUX_FILES() {
    ui_print "- Removing files from older Builds.."
  rm "${MODPATH}/SUX.log" 2>/dev/null
  # More Coming in next build
}


SET_PERMISSION() {
ui_print "- Setting up Permissions"
set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm_recursive "${MODPATH}/SUX.sh" 0 0 0755 0700
}


SUX_EXTRACT() {
    ui_print "- Extracting module files..."
    unzip -o "$ZIPFILE" SUX.sh -d "$MODPATH" >&2 || { ui_print "Error: Failed to extract SUX.sh"; exit 1; }
    unzip -o "$ZIPFILE" service.sh -d "$MODPATH" >&2 || { ui_print "Error: Failed to extract service.sh"; exit 1; }
    unzip -o "$ZIPFILE" module.prop -d "$MODPATH" >&2 || { ui_print "Error: Failed to extract module.prop"; exit 1; }
}

SUX_PRINT() {
    ui_print ""
    ui_print " SUX - System Optimizer"
    ui_print " "
    sleep 2
    ui_print " [IMPORTANT] Before proceeding, please read the following:"
    ui_print " "
    sleep 1
    ui_print " [WARNING] This module makes system optimizations which might have"
    ui_print " [WARNING] varying effects on different devices. Use at your own risk."
    ui_print " "
    sleep 1
    ui_print " [INFO] - This module is designed to improve performance and latency."
    ui_print " [INFO] - It is recommended to create a BACKUP before installation."
    ui_print " [INFO] - For support, visit STRP x UNIVERSE on TG."
    ui_print " "
    sleep 1
    ui_print " [INFO] Logs:"
    ui_print " [INFO] - Info log: ${MODDIR}/info.log"
    ui_print " "
    sleep 1
    ui_print "[NOTE] If you encounter issues, reboot into Magisk Manager and disable this module."
    ui_print "[NOTE] Remember to create a full backup before making system modifications."
    ui_print "[NOTE] Visit the official support channel for assistance and updates."
    ui_print " "
    sleep 2
    ui_print "- Installing"
}


REMOVE_SUX_FILES
sleep 1
SUX_PRINT
SUX_EXTRACT
SET_PERMISSION
