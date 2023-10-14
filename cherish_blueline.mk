#
# Copyright (C) 2018-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Cherish OS stuff.
$(call inherit-product, vendor/cherish/config/common_full_phone.mk)
TARGET_DISABLE_EPPE := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_BUILD_APERTURE_CAMERA := false
TARGET_ENABLE_BLUR := true
TARGET_HAS_UDFPS := false
TARGET_USE_PIXEL_FINGERPRINT := false
TARGET_EXCLUDES_AUDIOFX := true
EXTRA_UDFPS_ANIMATIONS := false

# Maintainer Stuff
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.cherish.maintainer=26.pluvieux
CHERISH_BUILD_TYPE := UNOFFICIAL

#Gapps option 
TARGET_SUPPORTS_GOOGLE_RECORDER := false
TARGET_INCLUDE_STOCK_ARCORE := false
TARGET_SUPPORTS_CALL_RECORDING := false
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_INCLUDE_STOCK_ARCORE := false
TARGET_SUPPORTS_QUICK_TAP := true
WITH_GMS := true


# Inherit device configuration
$(call inherit-product, device/google/crosshatch/aosp_blueline.mk)

include device/google/crosshatch/blueline/device-lineage.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 3
PRODUCT_NAME := cherish_blueline

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=blueline \
    PRIVATE_BUILD_DESC="blueline-user 12 SP1A.210812.016.C2 8618562 release-keys"

BUILD_FINGERPRINT := google/blueline/blueline:12/SP1A.210812.016.C2/8618562:user/release-keys

$(call inherit-product, vendor/google/blueline/blueline-vendor.mk)

#add adb permission
PRODUCT_PRODUCT_PROPERTIES += \
ro.control_privapp_permissions=log \
ro.adb.secure=0 \
persist.sys.usb.config=mtp,adb \
persist.service.debuggable=1 \
persist.service.adb.enable=1
