include vendor/hexa/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/hexa/config/BoardConfigQcom.mk
endif

include vendor/hexa/config/BoardConfigSoong.mk
