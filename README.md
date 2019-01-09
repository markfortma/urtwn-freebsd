# Disclosure

I am not responsible for any issues. All of the source
files have their corresponding licenses so please review
them.

I am hopeful that the error causing issues with the *rtwn(4)*
driver is resolved in a timely manner; however, it is up
to the maintainers time as to when it does get fixed and tested.

# Description

This is the *urtwn(4)* driver from DragonFlyBSD v5.4.2
fitted to compile to FreeBSD v12 and later.

# Reasons

Due to a bug, which is yet to be worked out, my
Realtek 8192CU (EDIMAX N150) wireless N, nano USB
NIC would have the following issues:

1. Slow association with WAPs
2. ICMP packet loss between 10-75%
3. *fetch* speeds measuring 8-80kbps

Once I rebuilt the urtwn driver, from the most recent
DragonFlyBSD release, I experienced the following results:

1. Faster association with WAPs
2. ICMP with 0% packet loss
3. *fetch* speeds averaging 320kbps

# Building

1. Install the src from ISO
   * Optionally: Retrieve from the SVN repository
2. Unzip or clone this repository
3. Execute the shell file contained within
   ```
   ./deploy-sys-objects.sh
   ```
4. Build kernel modules
   ```
   cd /usr/src/sys/modules/urtwn/
   make clean
   make
   make install
   cd ../urtwnfw
   make clean
   make
   make install
   ```
5. Update your system configuration to use the if_urtwn.ko
   module
   * Refer to FreeBSD Handbook
