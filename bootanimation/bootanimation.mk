# Boot Animation

# 1440p
ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
PRODUCT_COPY_FILES += vendor/hexa/bootanimation/1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
# 1080p
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
PRODUCT_COPY_FILES += vendor/hexa/bootanimation/1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
# Default to 1080p if the device does not set the flag.
else
PRODUCT_COPY_FILES += vendor/hexa/bootanimation/1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif
