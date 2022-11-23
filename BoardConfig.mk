# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

include device/softwinner/polaris-common/BoardConfigCommon.mk

BOARD_KERNEL_CMDLINE += ion_reserve=80M

#Means 3 x screens
AW_WEBKIT_TILES := 36

#recovery
TARGET_RECOVERY_UI_LIB := librecovery_ui_polaris_p1
SW_BOARD_TOUCH_RECOVERY :=true
SW_BOARD_RECOVERY_CHAR_HEIGHT := 60
SW_BOARD_RECOVERY_CHAR_WIDTH  := 12
#/bootloader/recovery/minui/roboto_23x41.h,chose for change font size
SW_BOARD_USE_CUSTOM_RECOVERY_FONT := "roboto_10x18.h"

TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := true
TARGET_KERNEL_SOURCE := "kernel/softwinner/polaris_p1"
TARGET_KERNEL_CONFIG := "sun8iw3p1smp_android_defconfig"

# 1. realtek wifi configuration
BOARD_WIFI_VENDOR := realtek
ifeq ($(BOARD_WIFI_VENDOR), realtek)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl

    SW_BOARD_USR_WIFI := rtl8188eu
    BOARD_WLAN_DEVICE := rtl8188eu

    #SW_BOARD_USR_WIFI := rtl8723au
    #BOARD_WLAN_DEVICE := rtl8723au
endif

# cpu
TARGET_CPU_VARIANT := cortex-a7

# Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)