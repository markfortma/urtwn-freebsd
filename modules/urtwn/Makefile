# $FreeBSD: src/sys/modules/usb/urtwn/Makefile,v 1.1 2013/06/09 00:34:39 svnexp Exp $

.PATH: ${SRCTOP}/sys/dev/urtwn

SYSDIR?=${SRCTOP}/sys
.include "${SYSDIR}/conf/kern.opts.mk"

KMOD    = if_urtwn
SRCS    = if_urtwn.c if_urtwnreg.h \
	  bus_if.h device_if.h \
	  opt_bus.h opt_usb.h usb_if.h usbdevs.h opt_urtwn.h opt_wlan.h

.include <bsd.kmod.mk>
