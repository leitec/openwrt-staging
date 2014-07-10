#
# Copyright (C) 2008-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=powerpc
BOARD:=powermac
BOARDNAME:=Apple Power Macintosh
FEATURES:=fpu usb pci squashfs
CPU_TYPE:=601
MAINTAINER:=Claudio Leite <leitec@staticky.com>

LINUX_VERSION:=3.14.11

include $(INCLUDE_DIR)/target.mk

define Target/Description
	Build firmware images for Power Macintosh
endef

KERNELNAME:="zImage"

$(eval $(call BuildTarget))
