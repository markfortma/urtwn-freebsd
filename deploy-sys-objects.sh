#!/bin/sh

# author Matt Markfort
# date   2019-01-08
# description
#    Run this script to copy the _urtwn_ items
# from this repo to their correct placement
# within the FreeBSD src tree.
#


# Copy source files to /usr/src/sys/dev/
if [ -d dev ]; then
    if [ -d /usr/src/sys/dev/ ]; then
	cp -R dev/urtwn /usr/src/sys/dev/
    else
	printf "/usr/src/sys/dev is missing\n"
	printf "refer to FreeBSD Handbook on installing source\n"
	exit 1
    fi
else
    printf "dev/ missing\n"
    exit 1
fi


# Copy Makefiles to /usr/src/sys/modules
if [ -d modules ]; then
    if [ -d /usr/src/sys/modules ]; then
	cp -R modules/urtwn/ modules/urtwnfw/ /usr/src/sys/modules/
    else
	printf "/usr/src/sys/modules is missing\n"
	printf "refer to FreeBSD Handbook on installing source\n"
	exit 1
    fi
else
    printf "modules/ missing\n"
    exit 1
fi

# Copy firmware directory for rtwn to urtwn
if [ -d /usr/src/sys/contrib/dev ]; then
    cd /usr/src/sys/contrib/dev
    cp -R rtwn urtwn
    cd urtwn
    for fwfile in *.uu;
    do
	mv -f ${fwfile} u${fwfile}
    done
else
    printf "/usr/src/sys/contrib/dev is missing\n"
    printf "refer to FreeBSD Handbook on installing source\n"
    exit 1
fi
