# 
# Copyright (C) 2014-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3 or later.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mptcp
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Mario Krueger <openwrt@xedp3x.de>
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/mptcp
  SECTION:=utils
  CATEGORY:=LINK4ALL
  TITLE:=Multipath TCP configuration scrips
  DEPENDS:=+ip +iptables
  KCONFIG:=\
      CONFIG_MPTCP=y \
      CONFIG_MPTCP_BINDER=y \
      CONFIG_MPTCP_FULLMESH=y \
      CONFIG_MPTCP_NDIFFPORTS=y \
      CONFIG_MPTCP_PM_ADVANCED=y \
      CONFIG_MPTCP_REDUNDANT=y \
      CONFIG_MPTCP_ROUNDROBIN=y \
      CONFIG_MPTCP_SCHED_ADVANCED=y \
      CONFIG_DEFAULT_FULLMESH=y \
      CONFIG_DEFAULT_MPTCP_PM="fullmesh" \
      CONFIG_DEFAULT_MPTCP_SCHED="default" \
      CONFIG_DEFAULT_NDIFFPORTS=y \
      CONFIG_DEFAULT_REDUNDANT=y \
      CONFIG_DEFAULT_ROUNDROBIN=y \
      CONFIG_DEFAULT_SCHEDULER=y \
      CONFIG_DEFAULT_BINDER=y \
      CONFIG_DEFAULT_DUMMY=y \
      CONFIG_DEFAULT_OLIA=y \
      CONFIG_DEFAULT_BALIA=y \
      CONFIG_DEFAULT_LIA=y \
      CONFIG_DEFAULT_WVEGAS=y \
      CONFIG_DEFAULT_CUBIC=y \
      CONFIG_DEFAULT_RENO=y \
      CONFIG_DEFAULT_BBR=y \
      CONFIG_TCP_CONG_BALIA=y \
      CONFIG_TCP_CONG_LIA=y \
      CONFIG_TCP_CONG_OLIA=y \
      CONFIG_TCP_CONG_WVEGAS=y \
      CONFIG_TCP_CONG_BBR=y 
  PKGARCH:=all
endef

define Package/mptcp/description
  MultiPath TCP (MPTCP) is an effort towards enabling the simultaneous use of
  several IP-addresses/interfaces by a modification of TCP that presents a regular
  TCP interface to applications, while in fact spreading data across several
  subflows. Benefits of this include better resource utilization, better throughput
  and smoother reaction to failures.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/mptcp/install
	$(INSTALL_DIR) $(1) 
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,mptcp))
