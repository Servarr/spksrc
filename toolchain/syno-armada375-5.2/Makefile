TC_ARCH = armada375
TC_VERS = 5.2
TC_KERNEL = 3.2.40
TC_GLIBC = 2.15

TC_DIST = armada375-gcc464_glibc215_hard_armada-GPL
TC_DIST_SITE_PATH = Marvell%20Armada%20375%20Linux%203.2.40

TC_TARGET = arm-marvell-linux-gnueabi
TC_SYSROOT = $(TC_TARGET)/libc
TC_LIBRARY = $(TC_SYSROOT)/usr/lib
TC_EXTRA_CFLAGS = -mhard-float -mfpu=vfpv3

include ../../mk/spksrc.tc.mk
