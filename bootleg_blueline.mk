# Copyright (C) 2018 The Dirty Unicorns Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for an aosp Android
# build for flounder hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and flounder, hence its name.
#

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Include DU common configuration
include vendor/bootleggers/config/common_full_phone.mk

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/crosshatch/aosp_blueline.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

PRODUCT_NAME := bootleg_blueline
PRODUCT_DEVICE := blueline
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 3
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=blueline \
    BUILD_FINGERPRINT=google/blueline/blueline:9/PQ3A.190801.002/5670241:user/release-keys \
    PRIVATE_BUILD_DESC="blueline-user 9 PQ3A.190801.002 5670241 release-keys"

# Shishufied builds
BOOTLEGGERS_BUILD_TYPE := Shishufied

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bootleggers.maintainer=retr0gr4d3

$(call inherit-product-if-exists, vendor/google/blueline/blueline-vendor.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
