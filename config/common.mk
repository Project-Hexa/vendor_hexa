# Copyright (C) 2022 Project
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

PRODUCT_BRAND ?= Hexa

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/hexa/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/hexa/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/hexa/prebuilt/common/bin/50-hexa.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-hexa.sh

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/addon.d/50-hexa.sh

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/hexa/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/hexa/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/hexa/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/backuptool_ab.sh \
    system/bin/backuptool_ab.functions \
    system/bin/backuptool_postinstall.sh

# init file
PRODUCT_COPY_FILES += \
    vendor/hexa/prebuilt/common/etc/init/hexa-system.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/hexa-system.rc \
    vendor/hexa/prebuilt/common/etc/init/hexa-updates.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/hexa-updates.rc \
    vendor/hexa/prebuilt/common/etc/init/init.openssh.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.openssh.rc

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/hexa/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_PRODUCT)/usr/keylayout/Vendor_045e_Product_0719.kl

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    Launcher3QuickStep

# SetupWizard and Google Assistant properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.setupwizard.rotation_locked=true \
    setupwizard.theme=glif_v3_light \
    ro.opa.eligible_device=true
endif

# Superior Permissions
PRODUCT_COPY_FILES += \
    vendor/hexa/config/permissions/privapp-permissions-hexa-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hexa.xml \
    vendor/hexa/config/permissions/privapp-permissions-hexa-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-hexa-system_ext.xml \
    vendor/hexa/config/permissions/privapp-permissions-hexa.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-hexa.xml

# Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/hexa/overlay/dictionaries

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/hexa/overlay

# Device Overlays
DEVICE_PACKAGE_OVERLAYS += vendor/hexa/overlay/common

# Packages
$(call inherit-product, vendor/hexa/config/packages.mk)

# Version
$(call inherit-product, vendor/hexa/config/version.mk)

# Audio
$(call inherit-product, vendor/hexa/config/audio.mk)

#Telephony
$(call inherit-product, vendor/hexa/config/telephony.mk)

# Props
$(call inherit-product, vendor/hexa/config/props.mk)
