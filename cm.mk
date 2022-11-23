$(call inherit-product, device/softwinner/polaris_p1/polaris_p1.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
PRODUCT_NAME := cm_polaris_p1
PRODUCT_DEVICE := polaris_p1
PRODUCT_BRAND := Allwinner-Tablet
PRODUCT_MANUFACTURER := polaris_p1
PRODUCT_MODEL  := Allwinner-Tablet