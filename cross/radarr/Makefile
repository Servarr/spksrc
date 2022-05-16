PKG_NAME = Radarr
PKG_BRANCH = arm-vfpv3d16-2
PKG_VERS = 4.2.0.6283
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME).$(PKG_BRANCH).$(PKG_VERS).linux-core-$(PKG_DIST_ARCH).$(PKG_EXT)
PKG_DIST_FILE = $(PKG_DIST_NAME)
PKG_DIR = Radarr

DEPENDS =

UNSUPPORTED_ARCHS = $(PPC_ARCHS) $(ARMv5_ARCHS) $(ARMv7L_ARCHS) $(i686_ARCHS)

HOMEPAGE = https://radarr.video/
COMMENT  = Radarr is a movie collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new movies and will interface with clients and indexers to grab, sort, and rename them. It can also be configured to automatically upgrade the quality of existing files in the library when a better quality format becomes available.
LICENSE  = GPLv3

CHECKSUM_TARGET = radarr_checksum
INSTALL_TARGET = radarr_install

include ../../mk/spksrc.archs.mk
PKG_DIST_ARCH = x64
ifeq ($(ARCH),$(GENERIC_ARMv7VFPv3d16_ARCH))
PKG_DIST_ARCH = arm-vfpv3d16
else ifeq ($(findstring $(ARCH),$(ARMv7_ARCHS)),$(ARCH))
PKG_DIST_ARCH = arm
else ifeq ($(findstring $(ARCH),$(ARMv8_ARCHS)),$(ARCH))
PKG_DIST_ARCH = arm64
endif

include ../../mk/spksrc.install-resources.mk

URLS=https://radarr.servarr.com/v1/update/$(PKG_BRANCH)/updatefile?version=$(PKG_VERS)\&os=linux\&runtime=netcore\&arch=$(PKG_DIST_ARCH)
ifeq ($(PKG_DIST_ARCH),arm-vfpv3d16)
URLS='https://artprodcus3.artifacts.visualstudio.com/Ae81bf62d-a2b3-4a5c-8bc1-60cc428c0287/961c82cf-1428-4ab0-9257-63be1671eac8/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL1JhZGFyci9wcm9qZWN0SWQvOTYxYzgyY2YtMTQyOC00YWIwLTkyNTctNjNiZTE2NzFlYWM4L2J1aWxkSWQvNDg2Mi9hcnRpZmFjdE5hbWUvUGFja2FnZXM1/content?format=file&subPath=%2FRadarr.merge.4.2.0.6283.linux-core-arm-vfpv3d16.tar.gz'
endif

.PHONY: radarr_install radarr_checksum
radarr_checksum:

radarr_install:
	rm -rf $(WORK_DIR)/$(PKG_DIR)/Radarr.Update
	mkdir -p $(STAGING_INSTALL_PREFIX)/usr/lib/radarr/bin
	tar -cf - -C $(WORK_DIR)/$(PKG_NAME) . | tar -xf - -C $(STAGING_INSTALL_PREFIX)/usr/lib/radarr/bin
