# Sensitive Phone Numbers list
PRODUCT_PACKAGES += \
    sensitive_pn.xml

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true
