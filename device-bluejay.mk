#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Disable Artifact Requirements
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

# Always use scudo for memory allocator
PRODUCT_USE_SCUDO := true

# Pixel Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := bluejay
TARGET_KERNEL_PATH := device/google/bluejay-kernels
TARGET_KERNEL_DIR := $(TARGET_KERNEL_PATH)/6.1
TARGET_BOARD_KERNEL_HEADERS := $(TARGET_KERNEL_DIR)/kernel-headers
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4

LOCAL_PATH := device/google/bluejay

# Inherit from gs101
include device/google/gs101/common.mk

# Overlays
PRODUCT_PACKAGES += \
    DMServiceOverlayVendorBluejay \
    FrameworkResOverlayProductBluejay \
    FrameworkResOverlayVendorBluejay \
    HbmSVManagerOverlayProductBluejay \
    PixelNfcOverlayBluejay \
    SafetyRegulatoryInfoOverlayProductBluejay \
    SettingsGoogleBluejayOverlay \
    SettingsGoogleOverlayProductBluejay \
    SettingsOverlayG1AZG \
    SettingsOverlayGB17L \
    SettingsOverlayGB62Z \
    SettingsOverlayGX7AS \
    SystemUIGoogleOverlayVendorBluejay \
    Alch3mySettingsBluejay

PRODUCT_PACKAGES += \
    ApertureOverlayBluejay

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

PRODUCT_PRODUCT_PROPERTIES += \
	ro.opa.eligible_device=true \
	ro.com.google.clientidbase=android-google \
	ro.com.google.ime.theme_id=5 \
	ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms \
	ro.support_one_handed_mode=true \
	ro.quick_start.device_id=bluejay \
	ro.product.brand_for_attestation=google \
	ro.product.device_for_attestation=bluejay \
	ro.product.manufacturer_for_attestation=Google \
	ro.product.model_for_attestation=Pixel 6a \
	ro.product.name_for_attestation=bluejay \

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	debug.sf.enable_sdr_dimming=1 \
	debug.sf.dim_in_gamma_in_enhanced_screenshots=1 \
	ro.hardware.keystore_desede=true \
	ro.hardware.keystore=trusty \
	ro.hardware.gatekeeper=trusty \
	persist.vendor.enable.thermal.genl=true \
	ro.incremental.enable=true \
	vendor.usb.product_string=Pixel 6a

PRODUCT_SYSTEM_EXT_PROPERTIES += \
ro.hotword.detection_service_required=false

# Recovery
PRODUCT_COPY_FILES += \
    device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.bluejay.rc

PRODUCT_PACKAGES += \
    init.recovery.bluejay.touch.rc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 32

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
