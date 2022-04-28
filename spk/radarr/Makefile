SPK_NAME = radarr_official
SPK_CONFLICT = radarr
SPK_VERS = 4.1.0.6175
SPK_ICON = src/radarr.png

REQUIRED_MIN_DSM = 6.0

# .NET is not supported on PPC, ARM5, ARM7L and x86
UNSUPPORTED_ARCHS = $(PPC_ARCHS) $(ARMv5_ARCHS) $(ARMv7L_ARCHS) $(i686_ARCHS)

DEPENDS = cross/sqlite cross/radarr

MAINTAINER = Team Radarr
MAINTAINER_URL = https://radarr.video/
HELPURL    = https://wiki.servarr.com/Radarr
SUPPORTURL = https://radarr.video/\#support

DESCRIPTION = Radarr is a movie collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new movies and will interface with clients and indexers to grab, sort, and rename them. It can also be configured to automatically upgrade the quality of existing files in the library when a better quality format becomes available.
STARTABLE = yes
DISPLAY_NAME = Radarr
CHANGELOG = "Radarr v$(SPK_VERS)"

HOMEPAGE = https://radarr.video/
LICENSE  = GPLv3

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 7878
SERVICE_PORT_TITLE = $(DISPLAY_NAME)

# Admin link for in DSM UI
ADMIN_PORT = $(SERVICE_PORT)

WIZARDS_DIR = src/wizard/

POST_STRIP_TARGET = radarr_extra_install

# use alternate TMPDIR as /tmp might be too small.
USE_ALTERNATE_TMPDIR = 1

include ../../mk/spksrc.spk.mk

# hack for bad libstdc++ on dsm6
ifeq ($(call version_lt, ${SPK_TCVERS}, 7.0),1)
DEPENDS := cross/libstdc++ $(DEPENDS)
endif

PACKAGE_VERSION = $(SPK_VERS)-spk$(SPK_REV)-$(SPK_NAME_ARCH)-$(SPK_TCVERS)
PACKAGE_AUTHOR = [Team Radarr](https://radarr.video)

.PHONY: radarr_extra_install
radarr_extra_install:
	@install -m 755 -d $(STAGING_DIR)/app
	@echo "PackageVersion=$(PACKAGE_VERSION)\nPackageAuthor=$(PACKAGE_AUTHOR)" > $(STAGING_DIR)/package_info
