HEXA_BASE_VERSION := 1.0-Beta
BUILD_TYPE ?= UNOFFICIAL
HEXA_OTA_BRANCH := 13

# Set all versions
BUILD_DATE := $(shell date -u +%d%m%Y)
BUILD_TIME := $(shell date -u +%H%M)
ROM_FINGERPRINT := Hexa/$(HEXA_BASE_VERSION)/$(PLATFORM_VERSION)/$(BUILD_TYPE)/$(BUILD_ID)/$(BUILD_DATE)/$(BUILD_TIME)

ifndef
     HEXA_VERSION := Hexa-$(HEXA_BASE_VERSION)-$(HEXA_OTA_BRANCH)-$(BUILD_DATE)-$(BUILD_TYPE)-$(BUILD_TIME)
 ifeq ($(USE_GAPPS),true)
     HEXA_VERSION := Hexa-$(HEXA_BASE_VERSION)-$(HEXA_OTA_BRANCH)-Gapps-$(BUILD_DATE)-$(BUILD_TYPE)-$(BUILD_TIME)
 endif
endif

HEXA_PROPERTIES := \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.hexa.build.date=$(BUILD_DATE) \
    ro.hexa.version=$(HEXA_VERSION) \
    ro.hexa.build.type=$(BUILD_TYPE) \
    ro.hexa.build.version=$(HEXA_BASE_VERSION) \
    ro.hexa.fingerprint=$(ROM_FINGERPRINT) \
    ro.hexa.ota.version_code=$(HEXA_OTA_BRANCH)
