#
# Copyright (C) 2009-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

DEVICE_VARS += DEVICE_DTS KERNEL_SIZE PAGESIZE BLOCKSIZE SUBPAGESIZE
KERNEL_LOADADDR := 0x8000

define Device/Default
	KERNEL := kernel-bin | append-dtb | uImage none
	KERNEL_NAME := zImage
endef

define Device/dir665
	DEVICE_DTS := kirkwood-dir665
	KERNEL_SIZE := 1536k
	FILESYSTEMS := squashfs
	IMAGES := sysupgrade.bin
	IMAGE/sysupgrade.bin := append-kernel $$$$(KERNEL_SIZE) | append-rootfs | pad-rootfs
endef

define Device/ea3500
	DEVICE_DTS := kirkwood-ea3500
	PAGESIZE := 512
	SUBPAGESIZE := 256
	BLOCKSIZE := 16KiB
	KERNEL_SIZE := 2624k
	FILESYSTEMS := squashfs
	IMAGES := factory.bin sysupgrade.tar
	IMAGE/factory.bin := append-kernel $$$$(KERNEL_SIZE) | append-ubi
	IMAGE/sysupgrade.tar := sysupgrade-nand
endef

define Device/ea4500
	DEVICE_DTS := kirkwood-ea4500
	PAGESIZE := 2048
	SUBPAGESIZE := 512
	BLOCKSIZE := 128KiB
	KERNEL_SIZE := 2688k
	FILESYSTEMS := squashfs
	IMAGES := factory.bin sysupgrade.tar
	IMAGE/factory.bin := append-kernel $$$$(KERNEL_SIZE) | append-ubi
	IMAGE/sysupgrade.tar := sysupgrade-nand
endef

define Build/append-dtb
	cat $(DTS_DIR)/$(DEVICE_DTS).dtb >> $@
endef

define sanitize_profile_name
$(shell echo $(PROFILE) | tr '[:upper:]' '[:lower:]')
endef

$(eval TARGET_DEVICES += $(call sanitize_profile_name))
$(eval $(call BuildImage))
