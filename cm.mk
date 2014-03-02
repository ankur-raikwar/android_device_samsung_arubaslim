## Specify phone tech before including full_phone
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit cm stuff
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/arubaslim/device_arubaslim.mk)
$(call inherit-product, device/qcom/msm7x27a/BoardConfig.mk)

# Bootanimation args
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Overrides
PRODUCT_NAME := cm_arubaslim
PRODUCT_DEVICE := arubaslim
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := GT-I8262
PRODUCT_MANUFACTURER := Samsung
PRODUCT_CHARACTERISTICS := phone
