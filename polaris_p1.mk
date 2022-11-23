$(call inherit-product, device/softwinner/polaris-common/polaris-common.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# init.rc, kernel
PRODUCT_COPY_FILES += \
	device/softwinner/polaris_p1/modules/modules/nand.ko:root/nand.ko \
	device/softwinner/polaris_p1/init.sun8i.rc:root/init.sun8i.rc \
	device/softwinner/polaris_p1/ueventd.sun8i.rc:root/ueventd.sun8i.rc \
	device/softwinner/polaris_p1/initlogo.rle:root/initlogo.rle  \
	device/softwinner/polaris_p1/media/bootanimation.zip:system/media/bootanimation.zip \
	device/softwinner/polaris_p1/media/boot.wav:system/media/boot.wav \
	device/softwinner/polaris_p1/media/bootlogo.bmp:system/media/bootlogo.bmp \
	device/softwinner/polaris_p1/media/initlogo.bmp:system/media/initlogo.bmp \
	device/softwinner/polaris_p1/fstab.sun8i:root/fstab.sun8i \
	device/softwinner/polaris_p1/init.recovery.sun8i.rc:root/init.recovery.sun8i.rc

# wifi features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \

#key and tp config file
PRODUCT_COPY_FILES += \
	device/softwinner/polaris_p1/configs/sunxi-keyboard.kl:system/usr/keylayout/sunxi-keyboard.kl \
	device/softwinner/polaris_p1/configs/tp.idc:system/usr/idc/tp.idc \
	device/softwinner/polaris_p1/configs/gsensor.cfg:system/usr/gsensor.cfg

#copy touch and keyboard driver to recovery randisk
PRODUCT_COPY_FILES += \
    device/softwinner/polaris_p1/modules/modules/disp.ko:disp.ko \
    device/softwinner/polaris_p1/modules/modules/sunxi-keyboard.ko:sunxi-keyboard.ko \
    device/softwinner/polaris_p1/modules/modules/lcd.ko:lcd.ko \
    device/softwinner/polaris_p1/modules/modules/gt82x.ko:gt82x.ko \
    device/softwinner/polaris_p1/modules/modules/ft5x_ts.ko:ft5x_ts.ko \
    device/softwinner/polaris_p1/modules/modules/gt9xx_ts.ko:gt9xx_ts.ko \
    device/softwinner/polaris_p1/modules/modules/gslX680.ko:gslX680.ko \
    device/softwinner/polaris_p1/modules/modules/gslX680new.ko:gslX680new.ko \
    device/softwinner/polaris_p1/modules/modules/gt818_ts.ko:gt818_ts.ko \
    device/softwinner/polaris_p1/modules/modules/gt9xxf_ts.ko:gt9xxf_ts.ko \
    device/softwinner/polaris_p1/modules/modules/aw5306_ts.ko:aw5306_ts.ko \
    device/softwinner/polaris_p1/modules/modules/sw-device.ko:sw-device.ko

#vold config
PRODUCT_COPY_FILES += \
	device/softwinner/polaris_p1/vold.fstab:system/etc/vold.fstab \
	device/softwinner/polaris_p1/recovery.fstab:recovery.fstab 
# camera
PRODUCT_COPY_FILES += \
	device/softwinner/polaris_p1/configs/camera.cfg:system/etc/camera.cfg \
	device/softwinner/polaris_p1/configs/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
#	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml

# 3G Data Card Packages
PRODUCT_PACKAGES += \
	u3gmonitor \
	chat \
	rild \
	pppd

# 3G Data Card Configuration Flie
PRODUCT_COPY_FILES += \
	device/softwinner/polaris-common/rild/ip-down:system/etc/ppp/ip-down \
	device/softwinner/polaris-common/rild/ip-up:system/etc/ppp/ip-up \
	device/softwinner/polaris-common/rild/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/softwinner/polaris-common/rild/usb_modeswitch:system/bin/usb_modeswitch \
	device/softwinner/polaris-common/rild/call-pppd:system/xbin/call-pppd \
	device/softwinner/polaris-common/rild/usb_modeswitch.sh:system/xbin/usb_modeswitch.sh \
	device/softwinner/polaris-common/rild/apns-conf_sdk.xml:system/etc/apns-conf.xml \
	device/softwinner/polaris-common/rild/libsoftwinner-ril.so:system/lib/libsoftwinner-ril.so

# 3G Data Card usb modeswitch File
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/softwinner/polaris-common/rild/usb_modeswitch.d,system/etc/usb_modeswitch.d)

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Asia/Shanghai \
	persist.sys.language=zh \
	persist.sys.country=CN

#GPS Feature
PRODUCT_PACKAGES +=  gps.polaris
BOARD_USES_GPS_TYPE := simulator
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml

# evb logger
PRODUCT_COPY_FILES += \
       device/softwinner/polaris_p1/tools/logger.sh:system/bin/logger.sh

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage,adb \
	ro.udisk.lable=Polaris \
	ro.font.scale=1.0 \
	ro.hwa.force=true \
	rw.logger=0 \
	ro.sys.bootfast=true\
	ro.mem.opt=true

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160 \
	ro.product.firmware=v1.0

$(call inherit-product-if-exists, device/softwinner/polaris_p1/modules/modules.mk)

DEVICE_PACKAGE_OVERLAYS := device/softwinner/polaris_p1/overlay
PRODUCT_CHARACTERISTICS := tablet

# Overrides
PRODUCT_AAPT_CONFIG := mdpi hdpi 
PRODUCT_AAPT_PREF_CONFIG := hdpi

include device/softwinner/polaris-common/prebuild/google/products/gms.mk
