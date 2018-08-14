# Copyright 2014 The Android Open Source Project
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

include device/sony/tama/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := unknown
ifneq (,$(filter %h8216,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := H8216
else ifneq (,$(filter %h8266,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := H8266
else
TARGET_BOOTLOADER_BOARD_NAME := H8216
$(warning Unrecognized value for TARGET_PRODUCT: "$(TARGET_PRODUCT)", using default value: "$(TARGET_BOOTLOADER_BOARD_NAME)")
endif

# Platform
PRODUCT_PLATFORM := tama

# NFC
NXP_CHIP_TYPE := PN553
NXP_CHIP_FW_TYPE := PN553

BOARD_KERNEL_CMDLINE += androidboot.hardware=akari

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4227858432
# Reserve space for data encryption (44712771584-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 44712755200

# DTBO partition definitions
ifneq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
BOARD_PREBUILT_DTBOIMAGE := kernel/sony/msm-4.9/common-kernel/dtbo-akari.img
endif
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

TARGET_DEVICE_NO_FPC := true
