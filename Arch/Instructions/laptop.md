Change the suspend variant to a more efficient one:
```
/etc/default/grub
-------------------------------------------------------
GRUB_CMDLINE_LINUX_DEFAULT="... mem_sleep_default=deep"
```

bluetooth
```
systemctl enable bluetooth
systemctl start bluetooth
```

hibernate
```
/etc/udev/rules.d/99-lowbat.rules
-----------------------------------------------------------------------
# Suspend the system when battery level drops to 5% or lower
SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", RUN+="/usr/bin/systemctl hibernate"
```
