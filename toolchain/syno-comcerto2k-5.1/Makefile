TC_ARCH = comcerto2k
TC_VERS = 5.1
TC_FIRMWARE = 5.0-4458
TC_KERNEL = 3.2.40
TC_GLIBC = 2.17

TC_DIST = gcc464_glibc217_neon_comcerto-GPL
TC_EXT = tgz
TC_DIST_SITE_PATH = Mindspeed%20Comcerto%202000%20Linux%203.2.40

TC_TARGET = arm-cortexa9-linux-gnueabi
TC_SYSROOT = $(TC_TARGET)/sysroot
TC_EXTRA_CFLAGS = -mfloat-abi=hard -mtune=cortex-a15 -mfpu=neon-vfpv4 -mthumb

include ../../mk/spksrc.tc.mk
