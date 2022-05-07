SPK_NAME = sonarr_official
SPK_CONFLICT = nzbdrone
SPK_VERS = 3.0.5.1144
SPK_ICON = src/sonarr.png

REQUIRED_MIN_DSM = 6.0

UNSUPPORTED_ARCHS = $(PPC_ARCHS) $(ARMv7L_ARCHS)

DEPENDS = cross/sonarr cross/debian-buster

MAINTAINER = Servarr
MAINTAINER_URL = https://sonarr.tv/
HELPURL    = https://wiki.servarr.com/Sonarr
SUPPORTURL = https://sonarr.tv/\#support

DESCRIPTION = Sonarr is a PVR for newsgroup and torrent users. It can monitor multiple RSS feeds for new episodes of your favourite shows and will grab, sorts and rename them. It can also be configured to automatically upgrade the quality of files already downloaded if a better quality format becomes available.
DESCRIPTION_FRE = Sonarr est un PVR pour les utilisateurs de groupes de discussion et torrents. Il peut surveiller plusieurs flux RSS pour les nouveaux épisodes de vos séries préférées et saisira, sortes et les renomme. Il peut également être configuré pour mettre à jour automatiquement la qualité des fichiers déjà téléchargés si un meilleur format de qualité devient disponible.
DESCRIPTION_SPN = Sonarr es un PVR para los usuarios de grupos de noticias y torrents. Se puede controlar múltiples canales RSS para nuevos episodios de sus programas favoritos y se agarra, tipo y les cambia el nombre. También puede ser configurado para actualizar automáticamente la calidad de los archivos ya descargados si un formato de mejor calidad disponible.
DISPLAY_NAME = Sonarr
STARTABLE = yes
CHANGELOG = "${DISPLAY_NAME} v$(SPK_VERS)"

HOMEPAGE = https://sonarr.tv
LICENSE  = GPLv3

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 8989
SERVICE_PORT_TITLE = $(DISPLAY_NAME)

# Admin link for in DSM UI
ADMIN_PORT = $(SERVICE_PORT)

WIZARDS_DIR = src/wizard/

POST_STRIP_TARGET = rootfs_install

# DSM prevents executing from /tmp in 7.1
USE_ALTERNATE_TMPDIR = 1

include ../../mk/spksrc.common.mk

ifeq ($(call version_lt, ${TCVERSION}, 7.0),1)
DEPENDS += cross/bubblewrap
else
SPK_DEPENDS = "bubblewrap>=0.6.1"
endif

include ../../mk/spksrc.spk.mk

PACKAGE_VERSION = $(SPK_VERS)-spk$(SPK_REV)-$(SPK_NAME_ARCH)-$(SPK_TCVERS)
PACKAGE_AUTHOR = [$(MAINTAINER)]($(MAINTAINER_URL))

.PHONY: app_extra_install rootfs_install

rootfs_install:
	sudo debuerreotype-apt-get $(STAGING_DIR)/rootfs update; \
	sudo debuerreotype-apt-get $(STAGING_DIR)/rootfs install -y apt-transport-https dirmngr gnupg ca-certificates; \
	sudo debuerreotype-chroot $(STAGING_DIR)/rootfs apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF; \
	sudo debuerreotype-chroot $(STAGING_DIR)/rootfs sh -c 'echo "deb https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official.list'; \
	sudo debuerreotype-apt-get $(STAGING_DIR)/rootfs update; \
	sudo debuerreotype-apt-get $(STAGING_DIR)/rootfs install -y --no-install-recommends --no-install-suggests locales tzdata libsqlite3-0 libmediainfo0v5 mono-devel ca-certificates-mono; \
	rm -rf $(STAGING_DIR)/tmp/* $(STAGING_DIR)/var/lib/apt/lists/* $(STAGING_DIR)/var/tmp/*; \

app_extra_install:
	@install -m 755 -d $(STAGING_DIR)/app
	@echo "PackageVersion=$(PACKAGE_VERSION)\nPackageAuthor=$(PACKAGE_AUTHOR)" > $(STAGING_DIR)/usr/lib/sonarr/package_info
